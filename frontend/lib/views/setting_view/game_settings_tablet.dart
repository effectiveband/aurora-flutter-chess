part of 'game_settings_view.dart';

class GameSettingsTablet extends StatelessWidget {
  const GameSettingsTablet({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final gameSettingsProvider = context.read<GameSettingsProvider>();
    final l10n = AppLocalizations.of(context);
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
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Selector<
                        GameSettingsProvider,
                        ({
                          bool withoutTime,
                          int durationOfGame,
                          int addingOfMove
                        })>(
                      selector: (_, provider) => (
                        withoutTime: provider.withoutTime,
                        durationOfGame: provider.durationOfGame,
                        addingOfMove: provider.addingOfMove
                      ),
                      builder: (_, values, __) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppBarSettings(label: l10n.settings),
                            CustomTabBar(
                              initialIndex: values.withoutTime ? 0 : 1,
                              header: l10n.time,
                              subTitles: [
                                l10n.withoutTimer,
                                l10n.withTimer,
                              ],
                              isSettingsPage: true,
                              onTap: (dynamic index) =>
                                  gameSettingsProvider.setIsTime(index as int),
                            ),
                            if (!values.withoutTime) ...[
                              const SizedBox(height: 70),
                              SetTimeSection(
                                minutesStartValue: values.durationOfGame,
                                minutesOnChanged: (dynamic value) =>
                                    gameSettingsProvider
                                        .setMinutes(value as int),
                                secondsStartValue: values.addingOfMove == 0
                                    ? GameSettingConsts.longDashSymbol
                                    : values.addingOfMove,
                                secondsOnChanged: (dynamic value) =>
                                    gameSettingsProvider
                                        .setSeconds(value as int),
                              )
                            ],
                            const SizedBox(height: 120),
                            const SettingsRowsSection(),
                            const SizedBox(height: 100),
                          ],
                        );
                      },
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
                      text: l10n.startGameButton,
                      textColor: ColorsConst.primaryColor0,
                      buttonColor: scheme.secondaryContainer,
                      isClickable: true,
                      onTap: () =>
                          gameSettingsProvider.handleStartGame(context),
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
