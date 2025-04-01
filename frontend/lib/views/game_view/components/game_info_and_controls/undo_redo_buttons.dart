import "../../../../exports.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class UndoRedoButtons extends StatelessWidget {
  final GameModel gameModel;

  bool get undoEnabled {
    if (gameModel.playingWithAI) {
      return (gameModel.game?.board.moveStack.length ?? 0) > 1 &&
          !gameModel.isAIsTurn;
    } else {
      return gameModel.game?.board.moveStack.isNotEmpty ?? false;
    }
  }

  bool get redoEnabled {
    if (gameModel.playingWithAI) {
      return (gameModel.game?.board.redoStack.length ?? 0) > 1 &&
          !gameModel.isAIsTurn;
    } else {
      return gameModel.game?.board.redoStack.isNotEmpty ?? false;
    }
  }

  //временное решение для верстки
  final bool isPro;

  const UndoRedoButtons(this.gameModel, {super.key, required this.isPro});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: isPro ? scheme.onInverseSurface : ColorsConst.disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: SvgPicture.asset(
                  GamePageConst.leftArrow,
                  colorFilter: ColorFilter.mode(
                      isPro
                          ? (gameModel.allowUndoRedo ||
                                  gameModel.playerCount == 2)
                              ? scheme.primary
                              : scheme.onError
                          : ColorsConst.neutralColor100,
                      BlendMode.srcIn),
                ),
                highlightColor: Colors.white.withOpacity(0.3),
                onPressed:
                    ((gameModel.allowUndoRedo || gameModel.playerCount == 2) &&
                            undoEnabled &&
                            isPro)
                        ? () => undo()
                        : null,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: IconButton(
                icon: SvgPicture.asset(
                  GamePageConst.rightArrow,
                  colorFilter: ColorFilter.mode(
                      isPro
                          ? (gameModel.allowUndoRedo ||
                                  gameModel.playerCount == 2)
                              ? scheme.primary
                              : scheme.onError
                          : ColorsConst.neutralColor100,
                      BlendMode.srcIn),
                ),
                highlightColor: Colors.white.withOpacity(0.3),
                onPressed:
                    ((gameModel.allowUndoRedo || gameModel.playerCount == 2) &&
                            redoEnabled &&
                            isPro)
                        ? () => redo()
                        : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void undo() {
    if (gameModel.playingWithAI) {
      gameModel.game?.undoTwoMoves();
    } else {
      gameModel.game?.undoMove();
    }
  }

  void redo() {
    if (gameModel.playingWithAI) {
      gameModel.game?.redoTwoMoves();
    } else {
      gameModel.game?.redoMove();
    }
  }
}
