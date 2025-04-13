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
              style: const TextStyles().body1.copyWith(
                    color: Theme.of(context).colorScheme.primary,
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
                style: const TextStyles().body1.copyWith(
                      color: Theme.of(context).colorScheme.primary,
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
