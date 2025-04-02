import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import "../../../../exports.dart";

class RestartExitButtons extends StatefulWidget {
  final GameModel gameModel;

  const RestartExitButtons(this.gameModel, {super.key});

  @override
  State<RestartExitButtons> createState() => _RestartExitButtonsState();
}

class _RestartExitButtonsState extends State<RestartExitButtons> {
  late Color lampColor;

  late bool isHint;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
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
                              child: const Center(
                                child: Text(
                                  GamePageConst.continueGameText,
                                  style: TextStyle(
                                    color: ColorsConst.neutralColor0,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MaterialButton(
                              onPressed: () async {
                                if (widget.gameModel.gameOver) {
                                  await addPartyToHistory(widget.gameModel);
                                }
                                if (!context.mounted) return;
                                widget.gameModel.newGame(context);
                                Navigator.of(dialogContext).pop();
                              },
                              height: 60,
                              color: scheme.outline,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  GamePageConst.gameRestartText,
                                  style: TextStyle(
                                    color: scheme.onTertiary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
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
                                await addPartyToHistory(widget.gameModel);
                                widget.gameModel.exitChessView();
                                if (!context.mounted) return;
                                context.go(RouteLocations.settingsScreen,
                                    extra: widget.gameModel);
                                Navigator.of(dialogContext).pop();
                              },
                              child: Center(
                                child: Text(
                                  GamePageConst.gameEndText,
                                  style: TextStyle(
                                    color: scheme.onTertiary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
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
          lampColor =
              (widget.gameModel.showHint || widget.gameModel.playerCount == 2)
                  ? scheme.primary
                  : scheme.onError;
          isHint = widget.gameModel.showHint &&
              widget.gameModel.playerCount == 1 &&
              widget.gameModel.isHintNeeded &&
              !widget.gameModel.isPersonalityMode;
          return Expanded(
            child: isPro
                ? TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 200),
                    tween: ColorTween(
                        begin: ColorsConst.neutralColor0.withOpacity(0),
                        end: isHint
                            ? ColorsConst.neutralColor0
                            : ColorsConst.neutralColor0.withOpacity(0)),
                    builder:
                        (BuildContext context, Color? value, Widget? child) {
                      return HintButton(
                        enabled: true,
                        onPressed: ((widget.gameModel.showHint ||
                                    widget.gameModel.playerCount == 2) &&
                                isPro)
                            ? () {
                                widget.gameModel.game!.aiHint();
                              }
                            : null,
                        lampColor:
                            isHint ? ColorsConst.primaryColor200 : lampColor,
                        hintAnimationColor: value,
                      );
                    },
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
