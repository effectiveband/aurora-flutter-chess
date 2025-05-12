import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../exports.dart';

// ignore: must_be_immutable
class BackArrowButton extends StatelessWidget {
  GameModel gameModel;
  BackArrowButton(this.gameModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.04,
      child: Stack(
        children: [
          CustomIconButton(
            iconName: GamePageConst.leftBigArrow,
            color: scheme.outlineVariant,
            iconSize: MediaQuery.sizeOf(context).height * 0.04,
            onTap: () async {
              if (gameModel.gameOver) {
                await addPartyToHistory(gameModel, l10n);
                if (!context.mounted) return;
                context.go(RouteLocations.settingsScreen, extra: gameModel);
              } else {
                showDialog(
                  context: context,
                  builder: (dialogContext) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: scheme.onBackground,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      titlePadding: const EdgeInsets.only(
                          top: 32, bottom: 0, left: 22, right: 22),
                      contentPadding: const EdgeInsets.only(
                          top: 16, bottom: 32, left: 22, right: 22),
                      title: Text(
                        l10n.surrenderConfirm,
                        textAlign: TextAlign.center,
                        style: TextStyles.title2.copyWith(
                          color: scheme.onTertiary,
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            onPressed: () => {
                              Navigator.of(dialogContext).pop(),
                            },
                            height: 60,
                            color: scheme.surfaceVariant,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                l10n.continueGame,
                                style: TextStyles.body1.copyWith(
                                  color: ColorsConst.neutralColor0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          MaterialButton(
                            onPressed: () async {
                              await addPartyToHistory(gameModel, l10n);
                              if (!context.mounted) return;
                              context.go(RouteLocations.settingsScreen,
                                  extra: gameModel);
                              Navigator.of(dialogContext).pop();
                            },
                            height: 60,
                            color: scheme.outline,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                l10n.surrender,
                                style: TextStyles.body1.copyWith(
                                  color: scheme.onTertiary,
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
            },
          ),
          const GameStatus(),
        ],
      ),
    );
  }
}
