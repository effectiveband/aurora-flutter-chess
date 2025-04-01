import "package:provider/provider.dart";

import "../../../exports.dart";
import "package:flutter/material.dart";

class GameInfoAndControls extends StatelessWidget {
  final GameModel gameModel;

  const GameInfoAndControls({
    super.key,
    required this.gameModel,
  });

  @override
  Widget build(BuildContext context) {
    final isPro = context.watch<ProVersionProvider>().isPro;
    return Row(
      children: [
        Expanded(
            child: RestartExitButtons(
          gameModel,
        )),
        const SizedBox(width: 10),
        Expanded(
            child: isPro
                ? UndoRedoButtons(
                    gameModel,
                  )
                : ProFunctionsTooltip(
                    modalHeader: ModalStrings.moveBackModalText,
                    isPro: isPro,
                    child: UndoRedoButtons(
                      gameModel,
                    ))),
      ],
    );
  }
}
