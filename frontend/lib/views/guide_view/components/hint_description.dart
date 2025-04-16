import "package:flutter/material.dart";
import "package:frontend/exports.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HintDescription extends StatelessWidget {
  const HintDescription({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        _getLocalizedHint(text, l10n),
        textAlign: TextAlign.center,
        style: TextStyles.body1.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  String _getLocalizedHint(String key, AppLocalizations l10n) {
    switch (key) {
      case "pawnFirstHint":
        return l10n.pawnFirstHint;
      case "pawnSecondHint":
        return l10n.pawnSecondHint;
      case "pawnThirdHint":
        return l10n.pawnThirdHint;
      case "rookHint":
        return l10n.rookHint;
      case "knightFirstHint":
        return l10n.knightFirstHint;
      case "knightSecondHint":
        return l10n.knightSecondHint;
      case "bishopHint":
        return l10n.bishopHint;
      case "queenHint":
        return l10n.queenHint;
      case "kingFirstHint":
        return l10n.kingFirstHint;
      case "kingSecondHint":
        return l10n.kingSecondHint;
      case "kingThirdHint":
        return l10n.kingThirdHint;
      case "kingFourthHint":
        return l10n.kingFourthHint;
      case "kingFifthHint":
        return l10n.kingFifthHint;
      case "enPassantFirstHint":
        return l10n.enPassantFirstHint;
      case "enPassantSecondHint":
        return l10n.enPassantSecondHint;
      case "enPassantThirdHint":
        return l10n.enPassantThirdHint;
      case "castlingFirstHint":
        return l10n.castlingFirstHint;
      case "castlingSecondHint":
        return l10n.castlingSecondHint;
      case "castlingThirdHint":
        return l10n.castlingThirdHint;
      default:
        return key;
    }
  }
}
