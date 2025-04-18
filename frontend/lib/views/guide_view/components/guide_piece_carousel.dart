import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:frontend/exports.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<String> pieceKeys = [
  "pawn",
  "rook",
  "knight",
  "bishop",
  "queen",
  "king",
  "enPassant",
  "castling"
];

Map<String, List<String>> hintsOfPieces = {
  "pawn": ["pawnFirstHint", "pawnSecondHint", "pawnThirdHint"],
  "rook": ["rookHint"],
  "knight": ["knightFirstHint", "knightSecondHint"],
  "bishop": ["bishopHint"],
  "queen": ["queenHint"],
  "king": [
    "kingFirstHint",
    "kingSecondHint",
    "kingThirdHint",
    "kingFourthHint",
    "kingFifthHint"
  ],
  "enPassant": [
    "enPassantFirstHint",
    "enPassantSecondHint",
    "enPassantThirdHint"
  ],
  "castling": ["castlingFirstHint", "castlingSecondHint", "castlingThirdHint"]
};

Map<String, List<String>> imgOfHints = {
  "pawn": GuideHintsNameConst.pawnHints,
  "rook": GuideHintsNameConst.rookHints,
  "knight": GuideHintsNameConst.knightHints,
  "bishop": GuideHintsNameConst.bishopHints,
  "queen": GuideHintsNameConst.queenHints,
  "king": GuideHintsNameConst.kingHints,
  "enPassant": GuideHintsNameConst.takingHints,
  "castling": GuideHintsNameConst.castlingHints,
};

class GuidePieceCarousel extends StatelessWidget {
  const GuidePieceCarousel({
    super.key,
    required this.pieceIndex,
    required this.index,
    required this.carouselController,
  });
  final int index;
  final int pieceIndex;
  final PageController carouselController;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    String pieceKey = pieceKeys[pieceIndex];
    String localizedName = _getLocalizedName(pieceKey, l10n);

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.04),
          child: FittedBox(
            child: Text(
              localizedName,
              style: TextStyles.title3.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            controller: carouselController,
            itemCount: imgOfHints[pieceKey]!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/guide_boards/${imgOfHints[pieceKey]![index]}",
                    height: MediaQuery.of(context).size.width * 0.74,
                  ),
                  HintDescription(
                    text: hintsOfPieces[pieceKey]![index],
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  String _getLocalizedName(String key, AppLocalizations l10n) {
    switch (key) {
      case "pawn":
        return l10n.pawn;
      case "rook":
        return l10n.rook;
      case "knight":
        return l10n.knight;
      case "bishop":
        return l10n.bishop;
      case "queen":
        return l10n.queen;
      case "king":
        return l10n.king;
      case "enPassant":
        return l10n.enPassant;
      case "castling":
        return l10n.castling;
      default:
        return key;
    }
  }
}
