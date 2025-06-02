import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:go_router/go_router.dart';
import 'package:sqflite/sqflite.dart';

class GameSettingsProvider extends ChangeNotifier {
  final GameModel gameModel;
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

  GameSettingsProvider({required this.gameModel}) {
    onInit();
  }
  void setIsTime(int chose) {
    isSettingsEdited = true;
    withoutTime = chose == 0;
    if (withoutTime) {
      gameModel.setTimeLimit(0);
    } else {
      gameModel.setTimeLimit(durationOfGame);
    }
    notifyListeners();
  }

  void setMinutes(chose) {
    if (!withoutTime) {
      gameModel.setTimeLimit(chose);
    }
    isSettingsEdited = true;
    durationOfGame = chose;
    notifyListeners();
  }

  void setSeconds(chose) {
    isSettingsEdited = true;
    addingOfMove = chose == GameSettingConsts.longDashSymbol ? 0 : chose;
    gameModel.setAddingOnMove(addingOfMove);
    notifyListeners();
  }

  void setIsMoveBack(bool chose) {
    isSettingsEdited = true;
    isMoveBack = chose;
    gameModel.setAllowUndoRedo(chose);
    notifyListeners();
  }

  void setIsThreats(bool chose) {
    isSettingsEdited = true;
    isThreats = chose;
    gameModel.setIsThreatsPicked(chose);
    notifyListeners();
  }

  void setIsHints(bool chose) {
    isSettingsEdited = true;
    isHints = chose;
    gameModel.setShowHint(chose);
    notifyListeners();
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
      isDBNotEmpty = true;
      notifyListeners();
    } else {
      gameModel.setTimeLimit(0);
      gameModel.setPlayerCount(1);
      gameModel.setAddingOnMove(0);
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

  Future<void> handleStartGame(BuildContext context) async {
    if (isSettingsEdited) await setSettings();
    if (!context.mounted) return;
    gameModel.newGame(context, notify: false);
    context.go(RouteLocations.gameScreen, extra: gameModel);
  }

  void onInit() async {
    var databasesPath = await getDatabasesPath();
    String p = "$databasesPath/settings.db";

    path = p;

    await getSettings();

    isLoading = false;
    notifyListeners();
  }
}
