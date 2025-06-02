part of 'game_settings_view.dart';

class GameSettingsMobile extends StatelessWidget {
  const GameSettingsMobile({
    super.key,
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
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 24),
                      child: Consumer<GameSettingsProvider>(
                          builder: (_, settingsProvider, __) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppBarSettings(
                                      label: GameSettingConsts.appBarLabel),
                                  CustomTabBar(
                                    initialIndex:
                                        settingsProvider.withoutTime ? 0 : 1,
                                    header: GameSettingConsts.timeText,
                                    subTitles: [
                                      GameSettingConsts.gameWithoutTimeText,
                                      GameSettingConsts.gameWithTimeText,
                                    ],
                                    isSettingsPage: true,
                                    onTap: (dynamic index) => settingsProvider
                                        .setIsTime(index as int),
                                  ),
                                  if (!settingsProvider.withoutTime) ...[
                                    SetTimeSection(
                                      minutesStartValue:
                                          settingsProvider.durationOfGame,
                                      minutesOnChanged: (dynamic value) =>
                                          settingsProvider
                                              .setMinutes(value as int),
                                      secondsStartValue:
                                          settingsProvider.addingOfMove == 0
                                              ? GameSettingConsts.longDashSymbol
                                              : settingsProvider.addingOfMove,
                                      secondsOnChanged: (dynamic value) =>
                                          settingsProvider.setSeconds(value),
                                    )
                                  ],
                                  const SettingsRowsSection(),
                                  const SizedBox(height: 100),
                                ],
                              )),
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
                      onTap: () => context
                          .read<GameSettingsProvider>()
                          .handleStartGame(context),
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
