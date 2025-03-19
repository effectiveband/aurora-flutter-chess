import "package:flame_svg/flame_svg.dart";
import "package:frontend/exports.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "package:provider/provider.dart";

void main() {
  runApp(const MyApp());
  _loadFlameAssets();
}

void _loadFlameAssets() async {
  for (var piece in ["king", "queen", "rook", "bishop", "knight", "pawn"]) {
    await Svg.load("images/pieces/$piece.svg");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).themeData,
          routerConfig: router,
        );
      }),
    );
  }
}
