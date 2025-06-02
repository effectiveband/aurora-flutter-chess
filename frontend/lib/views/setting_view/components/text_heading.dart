import "package:flutter/material.dart";
import "package:frontend/common/shared_functions.dart";
import "package:frontend/exports.dart";

class TextHeading extends StatelessWidget {
  const TextHeading({
    super.key,
    required this.text,
    required this.topMargin,
    required this.bottomMargin,
    this.style,
  });

  final String text;
  final double topMargin;
  final double bottomMargin;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin, bottom: bottomMargin),
      child: Text(
        text,
        style: TextStyles.title3.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontSize: SharedFunctions.isTablet(context)
              ? 45
              : TextStyles.title3.fontSize,
        ),
      ),
    );
  }
}
