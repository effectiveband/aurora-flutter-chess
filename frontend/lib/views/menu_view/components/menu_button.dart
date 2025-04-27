import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../exports.dart';

class MenuButton extends StatelessWidget {
  final GameModel gameModel;
  final ColorScheme scheme;
  final double height;
  final String buttonText;
  final String settingsScreenRoute;

  const MenuButton({
    required this.gameModel,
    required this.scheme,
    required this.height,
    required this.buttonText,
    required this.settingsScreenRoute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height * 0.8),
          child: NextPageButton(
            text: buttonText,
            textColor: ColorsConst.primaryColor0,
            buttonColor: scheme.secondaryContainer,
            isClickable: true,
            onTap: () => context.go(settingsScreenRoute, extra: gameModel),
          ),
        ),
      ),
    );
  }
}
