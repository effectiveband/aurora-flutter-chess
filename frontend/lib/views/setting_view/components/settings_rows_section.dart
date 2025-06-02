import 'package:flutter/material.dart';
import 'package:frontend/common/shared_functions.dart';
import 'package:frontend/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsRowsSection extends StatelessWidget {
  const SettingsRowsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsState = gameSettingsViewStateKey.currentState;
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
        Column(
          children: [
            SettingsRow(
              chose: settingsState?.isMoveBack,
              text: l10n.undoMoves,
              modalHeader: l10n.undoMovesDescription,
              onChanged: settingsState?.setIsMoveBack,
            ),
            SettingsRow(
              chose: settingsState?.isThreats,
              text: l10n.threats,
              modalHeader: l10n.threatsDescription,
              onChanged: settingsState?.setIsThreats,
            ),
            SettingsRow(
              chose: settingsState?.isHints,
              text: l10n.hints,
              modalHeader: l10n.hintsDescription,
              onChanged: settingsState?.setIsHints,
            )
          ],
        ),
      ],
    );
  }
}
