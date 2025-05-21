import "package:flutter/material.dart";
import "package:frontend/exports.dart";

class TextHeading extends StatelessWidget {
  const TextHeading(
      {super.key,
      required this.text,
      required this.topMargin,
      required this.bottomMargin,
      this.style,
      });

  final String text;
  final double topMargin;
  final double bottomMargin;
  final TextStyle? style;

  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 640;
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isTablet = _isTablet(context);
    return Container(
      margin: EdgeInsets.only(top: topMargin, bottom: bottomMargin),
      child: Text(
        text,
        style: TextStyles.title3.copyWith(
          color: scheme.primary,
          fontSize: isTablet ? 45 : TextStyles.title3.fontSize,
        ),
      ),
    );
  }
}
