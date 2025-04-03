import 'package:flutter/material.dart';

sealed class GradientConsts {
  static const orange = LinearGradient(
    colors: [Color.fromRGBO(255, 190, 146, 1), Color.fromRGBO(220, 101, 35, 1)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const grey = LinearGradient(
    colors: [Color.fromRGBO(52, 49, 46, 1), Color.fromRGBO(153, 148, 144, 1)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const greyAlt = LinearGradient(
    colors: [Color.fromRGBO(31, 26, 22, 1), Color.fromRGBO(126, 113, 102, 1)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const lightGrey = LinearGradient(
    colors: [
      Color.fromRGBO(128, 108, 97, 1),
      Color.fromARGB(255, 182, 171, 156)
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
