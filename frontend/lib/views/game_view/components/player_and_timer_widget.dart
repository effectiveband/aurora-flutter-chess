import 'package:flutter/material.dart';

import '../../../exports.dart';

class PlayerAndTimerWidget extends StatelessWidget {
  final GameModel gameModel;
  final Player currentPlayer;
  const PlayerAndTimerWidget(
      {super.key, required this.gameModel, required this.currentPlayer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            FittedBox(
              child: NameWithAdvantageForPlayer(
                player: currentPlayer,
                gameModel: gameModel,
              ),
            ),
            gameModel.timeLimit == 0
                ? const Spacer()
                : ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.sizeOf(context).height * 0.05),
                    child: FittedBox(
                      child: TimerWidget(
                        timeLeft: currentPlayer != Player.player1
                            ? gameModel.player1TimeLeft
                            : gameModel.player2TimeLeft,
                        isFilled: gameModel.turn != currentPlayer,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
