import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HintModel {
  final String id;
  final List<String> hintKeys;
  final List<String> imagePaths;
  final String Function(AppLocalizations) title;

  HintModel({
    required this.id,
    required this.hintKeys,
    required this.imagePaths,
    required this.title,
  });

  List<String> getLocalizedHints(AppLocalizations l10n) {
    return hintKeys
        .map((key) => _localizedHintMap[key]?.call(l10n) ?? key)
        .toList();
  }

  static final Map<String, String Function(AppLocalizations)>
      _localizedHintMap = {
    "pawnFirstHint": (l10n) => l10n.pawnFirstHint,
    "pawnSecondHint": (l10n) => l10n.pawnSecondHint,
    "pawnThirdHint": (l10n) => l10n.pawnThirdHint,
    "rookHint": (l10n) => l10n.rookHint,
    "knightFirstHint": (l10n) => l10n.knightFirstHint,
    "knightSecondHint": (l10n) => l10n.knightSecondHint,
    "bishopHint": (l10n) => l10n.bishopHint,
    "queenHint": (l10n) => l10n.queenHint,
    "kingFirstHint": (l10n) => l10n.kingFirstHint,
    "kingSecondHint": (l10n) => l10n.kingSecondHint,
    "kingThirdHint": (l10n) => l10n.kingThirdHint,
    "kingFourthHint": (l10n) => l10n.kingFourthHint,
    "kingFifthHint": (l10n) => l10n.kingFifthHint,
    "enPassantFirstHint": (l10n) => l10n.enPassantFirstHint,
    "enPassantSecondHint": (l10n) => l10n.enPassantSecondHint,
    "enPassantThirdHint": (l10n) => l10n.enPassantThirdHint,
    "castlingFirstHint": (l10n) => l10n.castlingFirstHint,
    "castlingSecondHint": (l10n) => l10n.castlingSecondHint,
    "castlingThirdHint": (l10n) => l10n.castlingThirdHint,
  };
}
