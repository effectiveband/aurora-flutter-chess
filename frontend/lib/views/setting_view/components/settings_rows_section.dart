import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsRowsSection extends StatelessWidget {
  const SettingsRowsSection(
      {super.key,
      required this.choseMoveBack,
      required this.moveBackOnChanged,
      required this.choseThreats,
      required this.threatsOnChanged,
      required this.choseHints,
      required this.hintsOnChanged});

  final bool choseMoveBack;
  final void Function(bool)? moveBackOnChanged;
  final bool choseThreats;
  final void Function(bool)? threatsOnChanged;
  final bool choseHints;
  final void Function(bool)? hintsOnChanged;

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
              ),
            ),
          ),
        ),
        Column(
          children: [
            SettingsRow(
              chose: choseMoveBack,
              text: l10n.undoMoves,
              modalHeader: l10n.undoMovesDescription,
              onChanged: moveBackOnChanged,
            ),
            SettingsRow(
              chose: choseThreats,
              text: l10n.threats,
              modalHeader: l10n.threatsDescription,
              onChanged: threatsOnChanged,
            ),
            SettingsRow(
              chose: choseHints,
              text: l10n.hints,
              modalHeader: l10n.hintsDescription,
              onChanged: hintsOnChanged,
            )
          ],
        ),
      ],
    );
  }
}
