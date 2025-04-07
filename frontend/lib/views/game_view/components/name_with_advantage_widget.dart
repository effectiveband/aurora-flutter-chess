import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../exports.dart';

// ignore: must_be_immutable
class NameWithAdvantageForPlayer extends StatelessWidget {
  GameModel gameModel;
  final Player player;
  NameWithAdvantageForPlayer(
      {required this.player, required this.gameModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.035),
          child: FittedBox(
            child: Text(
              player != gameModel.playerSide ? 'Игрок 1' : 'Игрок 2',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        if (gameModel.advantageForPlayer(oppositePlayer(player)) >
            gameModel.advantageForPlayer(player)) ...[
          Row(
            children: [
              SvgPicture.asset('assets/images/icons/advantage.svg'),
              Text(
                "+${gameModel.advantageForPlayer(oppositePlayer(player)) - gameModel.advantageForPlayer(player)}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ],
          )
        ]
      ],
    );
  }
}
