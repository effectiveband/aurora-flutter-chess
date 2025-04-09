import "package:provider/provider.dart";

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

  const UndoRedoButtons(this.gameModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isPro = context.watch<ProVersionProvider>().isPro;
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: (isPro & gameModel.allowUndoRedo)
            ? scheme.onInverseSurface
            : ColorsConst.disabledColor,
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
                      isPro & gameModel.allowUndoRedo
                          ? scheme.primary
                          : ColorsConst.neutralColor100,
                      BlendMode.srcIn),
                ),
                highlightColor: Colors.white.withOpacity(0.3),
                onPressed: (gameModel.allowUndoRedo && undoEnabled && isPro)
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
                      isPro & gameModel.allowUndoRedo
                          ? scheme.primary
                          : ColorsConst.neutralColor100,
                      BlendMode.srcIn),
                ),
                highlightColor: Colors.white.withOpacity(0.3),
                onPressed: (gameModel.allowUndoRedo && redoEnabled && isPro)
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
