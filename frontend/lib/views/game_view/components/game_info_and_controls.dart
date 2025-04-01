import "../../../exports.dart";
import "package:flutter/material.dart";

class GameInfoAndControls extends StatelessWidget {
  final GameModel gameModel;

  const GameInfoAndControls({
    super.key,
    required this.gameModel,
  });

  //временное решение для верстки
  final isPro = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: RestartExitButtons(
          gameModel,
          isPro: isPro,
        )),
        const SizedBox(width: 10),
        Expanded(
            child: isPro
                ? UndoRedoButtons(
                    gameModel,
                    isPro: isPro,
                  )
                : ProFunctionsTooltip(
                    modalHeader: ModalStrings.moveBackModalText,
                    isPro: isPro,
                    child: UndoRedoButtons(
                      gameModel,
                      isPro: isPro,
                    ))),
      ],
    );
  }
}
