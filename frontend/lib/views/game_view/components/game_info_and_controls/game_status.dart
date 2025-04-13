import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../../../exports.dart";

class GameStatus extends StatelessWidget {
  const GameStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Consumer<GameModel>(
      builder: (context, gameModel, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(getStatus(gameModel),
                textAlign: TextAlign.center,
                style: TextStyles.header2.copyWith(
                  color: scheme.primary,
                )),
          ),
          const SizedBox.shrink()
        ],
      ),
    );
  }
}

String getStatus(GameModel gameModel) {
  if (!gameModel.gameOver) {
    if (gameModel.turn == Player.player1) {
      return GamePageConst.gameStatusWhiteMove;
    } else {
      return GamePageConst.gameStatusBlackMove;
    }
  } else {
    if (gameModel.stalemate) {
      return GamePageConst.gameStatusStalemate;
    } else if (gameModel.draw) {
      return GamePageConst.gameStatusDraw;
    } else {
      if (gameModel.turn == Player.player1) {
        return GamePageConst.gameStatusBlackWin;
      } else {
        return GamePageConst.gameStatusWhiteWin;
      }
    }
  }
}
