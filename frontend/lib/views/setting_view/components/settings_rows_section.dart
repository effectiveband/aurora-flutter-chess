import 'package:flutter/material.dart';
import 'package:frontend/common/shared_functions.dart';
import 'package:frontend/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/views/setting_view/providers/game_settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsRowsSection extends StatelessWidget {
  const SettingsRowsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              l10n.gameSettings,
              style: TextStyles.title3.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: SharedFunctions.isTablet(context) ? 45 : null,
              ),
            ),
          ),
        ),
        Consumer<GameSettingsProvider>(
            builder: (_, provider, __) => Column(
                  children: [
                    SettingsRow(
                      chose: provider.isMoveBack,
                      text: l10n.undoMoves,
                      modalHeader: l10n.undoMovesDescription,
                      onChanged: provider.setIsMoveBack,
                    ),
                    SettingsRow(
                      chose: provider.isThreats,
                      text: l10n.threats,
                      modalHeader: l10n.threatsDescription,
                      onChanged: provider.setIsThreats,
                    ),
                    SettingsRow(
                      chose: provider.isHints,
                      text: l10n.hints,
                      modalHeader: l10n.hintsDescription,
                      onChanged: provider.setIsHints,
                    )
                  ],
                )),
      ],
    );
  }
}
