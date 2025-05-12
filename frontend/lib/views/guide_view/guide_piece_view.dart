import "package:flutter/material.dart";
import "package:frontend/views/guide_view/components/guide_constants.dart";
import "../../exports.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

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

class GuideView extends StatefulWidget {
  const GuideView({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<GuideView> createState() => _GuideViewState();
}

class _GuideViewState extends State<GuideView> {
  int index = 0;
  PageController carouselController = PageController(
    viewportFraction: 0.815,
  );

  @override
  void initState() {
    setState(() {
      index = widget.index;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  AppBarGuide(
                    isMainGuide: false,
                    iconName: GuideStrings.appbarIcon,
                    iconColor: scheme.onTertiary,
                    bottomMargin: 32,
                    header: AppLocalizations.of(context)!.guideHeader,
                  ),
                  Expanded(
                    child: GuidePieceCarousel(
                      hintModel: hintModels[index],
                      carouselController: carouselController,
                    ),
                  ),
                ],
              ),
            ),
            BottomBarGuide(
              index: index,
              onBack: () {
                if (index > 0) {
                  setState(() {
                    index -= 1;
                    carouselController.jumpToPage(0);
                  });
                }
              },
              onForward: () {
                if (index < hintsOfPieces.length - 1) {
                  setState(() {
                    index += 1;
                    carouselController.jumpToPage(0);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
