import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../exports.dart';

class MenuButton extends StatelessWidget {
  final GameModel gameModel;
  final double height;
  final String buttonText;
  final String settingsScreenRoute;

  const MenuButton({
    required this.gameModel,
    required this.height,
    required this.buttonText,
    required this.settingsScreenRoute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height * 0.8),
          child: NextPageButton(
            text: buttonText,
            textColor: ColorsConst.primaryColor0,
            buttonColor: colorScheme.secondaryContainer,
            isClickable: true,
            onTap: () => context.go(settingsScreenRoute, extra: gameModel),
          ),
        ),
      ),
    );
  }
}
