import "package:flutter/material.dart";
import "package:frontend/common/shared_functions.dart";
import "package:frontend/views/setting_view/providers/game_settings_provider.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import "package:provider/provider.dart";

import "../../exports.dart";
part 'game_settings_mobile.dart';
part 'game_settings_tablet.dart';

class GameSettingsView extends StatelessWidget {
  final GameModel gameModel;
  const GameSettingsView({super.key, required this.gameModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameSettingsProvider(gameModel: gameModel),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isLoading = (context
              .select((GameSettingsProvider provider) => provider.isLoading));
          if (isLoading) {
            return const LoadingWidget();
          }
          return SharedFunctions.isTablet(context)
              ? const GameSettingsTablet()
              : const GameSettingsMobile();
        },
      ),
    );
  }
}
