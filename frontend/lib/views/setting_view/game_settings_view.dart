import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:sqflite/sqflite.dart";

import "../../exports.dart";
part 'game_settings_mobile.dart';
part 'game_settings_tablet.dart';

class GameSettingsView extends StatefulWidget {
  const GameSettingsView(this.gameModel, {super.key});
  final GameModel gameModel;

  @override
  State<GameSettingsView> createState() => _GameSettingsViewState();
}

class _GameSettingsViewState extends State<GameSettingsView>
    with TickerProviderStateMixin {
  bool isLoading = true;
  bool isDBNotEmpty = false;
  bool withoutTime = true;
  bool isMoveBack = true;
  bool isThreats = false;
  bool isHints = false;
  int countOfTabs = 2;
  int durationOfGame = 15;
  int addingOfMove = 0;
  bool isSettingsEdited = false;
  late String path;

  void setIsTime(int chose) {
    setState(() {
      isSettingsEdited = true;
      withoutTime = chose == 0;
      if (withoutTime) {
        widget.gameModel.setTimeLimit(0);
      } else {
        widget.gameModel.setTimeLimit(durationOfGame);
      }
    });
  }

  void setMinutes(chose) {
    setState(() {
      if (!withoutTime) {
        widget.gameModel.setTimeLimit(chose);
      }
      isSettingsEdited = true;
      durationOfGame = chose;
    });
  }

  void setSeconds(chose) {
    setState(() {
      isSettingsEdited = true;
      addingOfMove = chose == GameSettingConsts.longDashSymbol ? 0 : chose;
      widget.gameModel.setAddingOnMove(addingOfMove);
    });
  }

  void setIsMoveBack(bool chose) {
    setState(() {
      isSettingsEdited = true;
      isMoveBack = chose;
      widget.gameModel.setAllowUndoRedo(chose);
    });
  }

  void setIsThreats(bool chose) {
    setState(() {
      isSettingsEdited = true;
      isThreats = chose;
      widget.gameModel.setIsThreatsPicked(chose);
    });
  }

  void setIsHints(bool chose) {
    setState(() {
      isSettingsEdited = true;
      isHints = chose;
      widget.gameModel.setShowHint(chose);
    });
  }

  Future<void> getSettings() async {
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(GameSettingConsts.dbCreateScript);
    });
    List<Map> list =
        await database.rawQuery(GameSettingConsts.dbGetSettingsScript);
    if (list.isNotEmpty) {
      Map data = list.first;
      setIsTime(data["withoutTime"]);
      setMinutes(data["durationGame"]);
      setSeconds(data["addingOnMove"]);
      setIsMoveBack(data["isMoveBack"] == 0);
      setIsThreats(data["isThreats"] == 0);
      setIsHints(data["isHints"] == 0);
      setState(() {
        isDBNotEmpty = true;
      });
    } else {
      widget.gameModel.setTimeLimit(0);
      widget.gameModel.setPlayerCount(1);
      widget.gameModel.setAddingOnMove(0);
      setIsMoveBack(true);
      setIsThreats(false);
      setIsHints(false);
    }

    await database.close();
  }

  Future<void> setSettings() async {
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(GameSettingConsts.dbCreateScript);
    });
    List<int> updatedSettings = [
      withoutTime ? 0 : 1,
      durationOfGame,
      addingOfMove,
      isMoveBack ? 0 : 1,
      isThreats ? 0 : 1,
      isHints ? 0 : 1
    ];

    if (isDBNotEmpty) {
      await database.rawUpdate(
          GameSettingConsts.dbUpdateSettingsScript, updatedSettings);
    } else {
      await database.rawInsert(
          GameSettingConsts.dbSetSettingsScript, updatedSettings);
    }

    await database.close();
  }

  Future<void> _handleStartGame(BuildContext context) async {
  if (isSettingsEdited) await setSettings();
  if (!context.mounted) return;
  widget.gameModel.newGame(context, notify: false);
  context.go(RouteLocations.gameScreen, extra: widget.gameModel);
}

  void onInit() async {
    var databasesPath = await getDatabasesPath();
    String p = "$databasesPath/settings.db";
    setState(() {
      path = p;
    });
    await getSettings();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const LoadingWidget();
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 640;
        return isTablet
            ? GameSettingsTablet(
                withoutTime: withoutTime,
                durationOfGame: durationOfGame,
                addingOfMove: addingOfMove,
                isMoveBack: isMoveBack,
                isThreats: isThreats,
                isHints: isHints,
                setIsTime: setIsTime,
                setMinutes: setMinutes,
                setSeconds: setSeconds,
                setIsMoveBack: setIsMoveBack,
                setIsThreats: setIsThreats,
                setIsHints: setIsHints,
                onStartGame: () => _handleStartGame(context),
              )
            : GameSettingsMobile(
                withoutTime: withoutTime,
                durationOfGame: durationOfGame,
                addingOfMove: addingOfMove,
                isMoveBack: isMoveBack,
                isThreats: isThreats,
                isHints: isHints,
                setIsTime: setIsTime,
                setMinutes: setMinutes,
                setSeconds: setSeconds,
                setIsMoveBack: setIsMoveBack,
                setIsThreats: setIsThreats,
                setIsHints: setIsHints,
                onStartGame: () => _handleStartGame(context),
              );
      },
    );
  }
}
