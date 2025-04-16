import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "../../../../exports.dart";

class RestartExitButtons extends StatelessWidget {
  final GameModel gameModel;

  const RestartExitButtons(this.gameModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: ShapeDecoration(
              color: scheme.onInverseSurface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: IconButton(
                icon: SvgPicture.asset(
                  GamePageConst.menuIcon,
                  colorFilter:
                      ColorFilter.mode(scheme.primary, BlendMode.srcIn),
                ),
                highlightColor: Colors.white.withOpacity(0.3),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (dialogContext) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AlertDialog(
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: scheme.onBackground,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        contentPadding: const EdgeInsets.only(
                            top: 32, bottom: 32, left: 22, right: 22),
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
                                if (gameModel.gameOver) {
                                  await addPartyToHistory(gameModel, context);
                                }
                                if (!context.mounted) return;
                                gameModel.newGame(context);
                                Navigator.of(dialogContext).pop();
                              },
                              height: 60,
                              color: scheme.outline,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  l10n.newGame,
                                  style: TextStyles.body1.copyWith(
                                    color: scheme.onTertiary,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MaterialButton(
                              height: 60,
                              color: scheme.outline,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              onPressed: () async {
                                await addPartyToHistory(gameModel, context);
                                gameModel.exitChessView();
                                if (!context.mounted) return;
                                context.go(RouteLocations.settingsScreen,
                                    extra: gameModel);
                                Navigator.of(dialogContext).pop();
                              },
                              child: Center(
                                child: Text(
                                  l10n.toMainMenu,
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
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Builder(builder: (context) {
          final isPro = context.watch<ProVersionProvider>().isPro;
          return Expanded(
            child: isPro
                ? HintButton(
                    enabled: gameModel.showHint,
                    onPressed: gameModel.showHint
                        ? () {
                            gameModel.game!.aiHint();
                          }
                        : null,
                  )
                : ProFunctionsTooltip(
                    modalHeader: ModalStrings.hintsModalText,
                    isPro: isPro,
                    child: const HintButton(
                      enabled: false,
                    ),
                  ),
          );
        }),
      ],
    );
  }
}
