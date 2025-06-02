import 'package:flutter/material.dart';

sealed class SharedFunctions {
  static bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 640;
  }
}
