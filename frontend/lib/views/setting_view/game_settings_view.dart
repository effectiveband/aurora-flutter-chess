import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:sqflite/sqflite.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "../../exports.dart";

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
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return isLoading
        ? const LoadingWidget()
        : DefaultTabController(
            length: countOfTabs,
            child: Scaffold(
              backgroundColor: scheme.background,
              body: SafeArea(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width,
                            minHeight: MediaQuery.of(context).size.height),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppBarSettings(label: l10n.settings),
                                CustomTabBar(
                                  initialIndex: withoutTime ? 0 : 1,
                                  header: l10n.time,
                                  subTitles: [
                                    l10n.withoutTimer,
                                    l10n.withTimer,
                                  ],
                                  isSettingsPage: true,
                                  onTap: setIsTime,
                                ),
                                if (!withoutTime) ...[
                                  SetTimeSection(
                                      minutesStartValue: durationOfGame,
                                      minutesOnChanged: setMinutes,
                                      secondsStartValue: addingOfMove == 0
                                          ? GameSettingConsts.longDashSymbol
                                          : addingOfMove,
                                      secondsOnChanged: setSeconds)
                                ],
                                SettingsRowsSection(
                                  choseMoveBack: isMoveBack,
                                  moveBackOnChanged: setIsMoveBack,
                                  choseThreats: isThreats,
                                  threatsOnChanged: setIsThreats,
                                  choseHints: isHints,
                                  hintsOnChanged: setIsHints,
                                ),
                                const SizedBox(height: 100),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: scheme.background,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 23, left: 23, right: 23),
                          child: NextPageButton(
                            text: l10n.startGame,
                            textColor: ColorsConst.primaryColor0,
                            buttonColor: scheme.secondaryContainer,
                            isClickable: true,
                            onTap: () async {
                              if (isSettingsEdited) {
                                await setSettings();
                              }
                              if (!context.mounted) return;
                              widget.gameModel.newGame(context, notify: false);
                              context.go(RouteLocations.gameScreen,
                                  extra: widget.gameModel);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
