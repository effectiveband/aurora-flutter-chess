import 'package:flutter/material.dart';
import 'package:frontend/constants/text_styles.dart';

sealed class SharedFunctions {
  static bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 640;
  }

  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          text,
          style: TextStyles.caption2,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
