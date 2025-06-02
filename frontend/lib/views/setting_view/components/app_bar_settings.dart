import "package:flutter/material.dart";
import "package:frontend/common/shared_functions.dart";
import "package:go_router/go_router.dart";
import "../../../exports.dart";

class AppBarSettings extends StatelessWidget {
  const AppBarSettings({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isTablet = SharedFunctions.isTablet(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          iconName: "assets/images/icons/left_big_arrow_icon.svg",
          color: scheme.onTertiary,
          iconSize: isTablet ? 50 : 40,
          onTap: () {
            context.go(RouteLocations.homeScreen);
          },
        ),
        Text(
          label,
          style: TextStyles.body1.copyWith(
            color: scheme.primary,
            fontSize: isTablet ? 30 : 20,
          ),
        ),
        ButtonToGuide(
          backGroundColor: scheme.outlineVariant,
          height: isTablet ? 50 : 40,
          width: isTablet ? 50 : 40,
          onTap: () {
            context.push(RouteLocations.guidebookScreen);
          },
        ),
      ],
    );
  }
}
