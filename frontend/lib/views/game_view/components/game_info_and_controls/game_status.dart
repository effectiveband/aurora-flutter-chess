import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "../../../../exports.dart";

class GameStatus extends StatelessWidget {
  const GameStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return Consumer<GameModel>(
      builder: (context, gameModel, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(getStatus(gameModel, l10n),
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

String getStatus(GameModel gameModel, AppLocalizations l10n) {
  if (!gameModel.gameOver) {
    if (gameModel.turn == Player.player1) {
      return l10n.whiteMove;
    } else {
      return l10n.blackMove;
    }
  } else {
    if (gameModel.stalemate) {
      return l10n.stalemate;
    } else if (gameModel.draw) {
      return l10n.draw;
    } else {
      if (gameModel.turn == Player.player1) {
        return l10n.blackWin;
      } else {
        return l10n.whiteWin;
      }
    }
  }
}
