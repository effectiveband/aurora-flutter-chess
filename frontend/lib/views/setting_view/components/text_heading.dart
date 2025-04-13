import "package:flutter/material.dart";
import "package:frontend/exports.dart";

class TextHeading extends StatelessWidget {
  const TextHeading(
      {super.key,
      required this.text,
      required this.topMargin,
      required this.bottomMargin});

  final String text;
  final double topMargin;
  final double bottomMargin;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.only(top: topMargin, bottom: bottomMargin),
      child: Text(
        text,
        style: TextStyles.title3.copyWith(
          color: scheme.primary,
        ),
      ),
    );
  }
}
