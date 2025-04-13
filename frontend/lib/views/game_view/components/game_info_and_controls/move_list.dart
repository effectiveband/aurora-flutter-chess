import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "../../../../exports.dart";

class MoveList extends StatelessWidget {
  final GameModel gameModel;
  final ScrollController scrollController = ScrollController();

  MoveList(this.gameModel, {super.key});

  final int len = 8;
  final int baseChar = 97;
  final String pieceName = "assets/images/pieces/";

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.04,
      margin: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.01,
          bottom: MediaQuery.sizeOf(context).height * 0.02),
      decoration: BoxDecoration(
        color: scheme.onInverseSurface,
      ),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          padding: const EdgeInsets.only(right: 24),
          child: Row(
            children: List.generate(gameModel.moveMetaList.length, (index) {
              final MoveMeta move = gameModel.moveMetaList[index];
              return ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height * 0.035),
                child: FittedBox(
                  child: Row(
                    children: [
                      index % 2 == 0
                          ? Row(
                              children: [
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  "${((index + 1) / 2).ceil().toString()}.",
                                  style: const TextStyles().body1.copyWith(
                                        color: scheme.error,
                                      ),
                                ),
                              ],
                            )
                          : const SizedBox(
                              width: 4,
                            ),
                      const SizedBox(
                        width: 4,
                      ),
                      move.type != ChessPieceType.promotion
                          ? Row(
                              children: [
                                SvgPicture.asset(
                                  "$pieceName${move.type!.name}.svg",
                                  width: 22,
                                  colorFilter: move.player == Player.player1
                                      ? const ColorFilter.mode(
                                          ColorsConst.neutralColor0,
                                          BlendMode.srcIn)
                                      : const ColorFilter.mode(
                                          ColorsConst.neutralColor300,
                                          BlendMode.srcIn),
                                ),
                                const SizedBox(
                                  width: 4,
                                )
                              ],
                            )
                          : const SizedBox(),
                      Text(
                        _moveToString(move),
                        style: const TextStyles().body1.copyWith(
                              color: move.player!.index == 0
                                  ? ColorsConst.primaryColor0
                                  : ColorsConst.neutralColor300,
                            ),
                      )
                    ],
                  ),
                ),
              );
            }),
          )),
    );
  }

  void _scrollToBottom() {
    if (gameModel.moveListUpdated) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      gameModel.moveListUpdated = false;
    }
  }

  String _moveToString(MoveMeta meta) {
    String move;
    if (meta.kingCastle) {
      move = "O-O";
    } else if (meta.queenCastle) {
      move = "O-O-O";
    } else {
      String takeString = (meta.took || meta.isEnPassant) ? "x" : "";
      String promotion = meta.promotion
          ? "=${pieceToChar(meta.promotionType ?? ChessPieceType.promotion).toUpperCase()}"
          : "";
      String tile = intToTile(meta.move!.to, gameModel, false);
      move = "$takeString$tile$promotion";
    }
    String check = meta.isCheck ? "+" : "";
    String checkmate = meta.isCheckmate && !meta.isStalemate ? "#" : "";
    return "$move$check$checkmate";
  }
}
