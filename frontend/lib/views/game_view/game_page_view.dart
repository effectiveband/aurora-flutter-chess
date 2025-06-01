import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:frontend/constants/assets.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "../../exports.dart";

class GameView extends StatefulWidget {
  final GameModel gameModel;

  const GameView(this.gameModel, {super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  bool isLoading = true;
  bool isMoveBack = true;
  bool isThreats = true;
  bool isHints = true;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final l10n = AppLocalizations.of(context);
    return isLoading
        ? const LoadingWidget()
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Consumer<GameModel>(
                builder: (context, gameModel, child) {
                  return PopScope(
                    canPop: true,
                    onPopInvoked: _willPopCallback,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MoveList(gameModel),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: deviceWidth * 0.03,
                              ),
                              child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: deviceHeight * 0.03),
                                  child: BackArrowButton(gameModel)),
                            ),
                            SizedBox(height: deviceHeight * 0.02),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: FittedBox(
                                  child: Column(
                                    children: [
                                      PlayerAndTimerWidget(
                                        gameModel: gameModel,
                                        currentPlayer: gameModel.playerSide,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: deviceHeight * 0.015),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: SvgPicture.asset(
                                                Assets.board,
                                                width: deviceWidth,
                                                height: deviceWidth *
                                                    LogicConsts.boardRatio,
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: ChessBoardWidget(
                                                    gameModel)),
                                          ],
                                        ),
                                      ),
                                      PlayerAndTimerWidget(
                                        gameModel: gameModel,
                                        currentPlayer: oppositePlayer(
                                            gameModel.playerSide),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(deviceHeight * 0.025),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: deviceHeight * 0.07),
                                child: GameInfoAndControls(
                                  gameModel: gameModel,
                                ),
                              ),
                            ),
                          ],
                        ),
                        gameModel.isPromotionForPlayer
                            ? SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: ColoredBox(
                                    color: Colors.transparent,
                                    child: Center(
                                        child: PieceChooseWindow(gameModel))))
                            : Container(),
                        gameModel.gameOver
                            ? Builder(
                                builder: (dialogContext) => Stack(
                                  children: [
                                    Container(
                                      width: deviceWidth,
                                      height: deviceHeight,
                                      color: Colors.black54,
                                    ),
                                    AlertDialog(
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: scheme.onBackground,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.0)),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          top: 32,
                                          bottom: 32,
                                          left: 22,
                                          right: 22),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            getStatus(gameModel, l10n),
                                            textAlign: TextAlign.center,
                                            style: TextStyles.title2.copyWith(
                                                color: scheme.onTertiary),
                                          ),
                                          const SizedBox(height: 20),
                                          MaterialButton(
                                            onPressed: () async {
                                              if (gameModel.gameOver) {
                                                await addPartyToHistory(
                                                    gameModel, l10n);
                                              }
                                              if (!context.mounted) return;
                                              gameModel.newGame(context);
                                            },
                                            height: 60,
                                            color: scheme.surfaceVariant,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Center(
                                              child: Text(
                                                l10n.newGame,
                                                style:
                                                    TextStyles.body1.copyWith(
                                                  color:
                                                      ColorsConst.neutralColor0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          MaterialButton(
                                            onPressed: () async {
                                              if (gameModel.gameOver) {
                                                await addPartyToHistory(
                                                    gameModel, l10n);
                                              }
                                              gameModel.exitChessView();
                                              if (!context.mounted) return;
                                              context.go(
                                                  RouteLocations.settingsScreen,
                                                  extra: gameModel);
                                              Navigator.of(dialogContext).pop();
                                            },
                                            height: 60,
                                            color: scheme.outline,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Center(
                                              child: Text(
                                                l10n.toMainMenu,
                                                style: TextStyles.body1
                                                    .copyWith(
                                                        color:
                                                            scheme.onTertiary),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
  }

  Future<void> _willPopCallback(bool didPop) async {
    widget.gameModel.exitChessView();
  }
}
