part of 'game_settings_view.dart';

class GameSettingsTablet extends StatelessWidget {
  final GameModel gameModel;
  final bool withoutTime;
  final int durationOfGame;
  final int addingOfMove;
  final bool isMoveBack;
  final bool isThreats;
  final bool isHints;
  final void Function(int) setIsTime;
  final void Function(int) setMinutes;
  final void Function(int) setSeconds;
  final void Function(bool) setIsMoveBack;
  final void Function(bool) setIsThreats;
  final void Function(bool) setIsHints;
  final VoidCallback onStartGame;

  const GameSettingsTablet({
    super.key,
    required this.gameModel,
    required this.withoutTime,
    required this.durationOfGame,
    required this.addingOfMove,
    required this.isMoveBack,
    required this.isThreats,
    required this.isHints,
    required this.setIsTime,
    required this.setMinutes,
    required this.setSeconds,
    required this.setIsMoveBack,
    required this.setIsThreats,
    required this.setIsHints,
    required this.onStartGame,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: scheme.background,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppBarSettings(label: GameSettingConsts.appBarLabel),
                          CustomTabBar(
                            initialIndex: withoutTime ? 0 : 1,
                            header: GameSettingConsts.timeText,
                            subTitles: [
                              GameSettingConsts.gameWithoutTimeText,
                              GameSettingConsts.gameWithTimeText,
                            ],
                            isSettingsPage: true,
                            onTap: (dynamic index) => setIsTime(index as int),
                          ),
                          if (!withoutTime) ...[
                            const SizedBox(height: 70),
                            SetTimeSection(
                              minutesStartValue: durationOfGame,
                              minutesOnChanged: (dynamic value) => setMinutes(value as int),
                              secondsStartValue: addingOfMove == 0
                                  ? GameSettingConsts.longDashSymbol
                                  : addingOfMove,
                              secondsOnChanged: (dynamic value) => setSeconds(value as int),
                            )
                          ],
                          const SizedBox(height: 120),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: scheme.background,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 23,
                      left: 23,
                      right: 23,
                    ),
                    child: NextPageButton(
                      text: GameSettingConsts.startGameText,
                      textColor: ColorsConst.primaryColor0,
                      buttonColor: scheme.secondaryContainer,
                      isClickable: true,
                      onTap: onStartGame,
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
