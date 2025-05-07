import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import "../../exports.dart";
import '../menu_view/phone_menu_layout.dart';
import '../menu_view/tablet_menu_layout.dart';

class MyMenuView extends StatefulWidget {
  static MyMenuView builder(BuildContext context, GoRouterState state) =>
      const MyMenuView();
  const MyMenuView({super.key});

  @override
  State<MyMenuView> createState() => _MyMenuViewState();
}

class _MyMenuViewState extends State<MyMenuView> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Consumer<GameModel>(
        builder: (context, gameModel, child) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isTablet = constraints.maxWidth >= 640;
                final size = Size(constraints.maxWidth, constraints.maxHeight);
                return isTablet
                    ? TabletMenuView(
                        gameModel: gameModel,
                        size: size,
                      )
                    : PhoneMenuView(
                        gameModel: gameModel,
                        size: size,
                      );
              },
            ),
          );
        },
      ),
    );
  }
}
