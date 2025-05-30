import "package:flutter/material.dart";
import "package:frontend/exports.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

List<String> piecesIcons = [
  "pawn.svg",
  "rook.svg",
  "knight.svg",
  "bishop.svg",
  "queen.svg",
  "king.svg",
];

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

enum Pieces { pawn, rook, knight, bishop, queen, king }

class GuideChoseView extends StatelessWidget {
  static GuideChoseView builder(BuildContext context, GoRouterState state) =>
      const GuideChoseView();
  const GuideChoseView({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: scheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AppBarGuide(
                  isMainGuide: true,
                  iconName: GuideStrings.appbarMainIcon,
                  iconColor: scheme.onTertiary,
                  bottomMargin: 21,
                  header: l10n.guideHeader,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: pieceKeys.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GuideChosePieceButton(
                        iconName: index < 6
                            ? "assets/images/pieces/${piecesIcons[index]}"
                            : null,
                        label: _getLocalizedName(pieceKeys[index], l10n),
                        isPiece: index < 6,
                        isPartyPage: false,
                        buttonColor: scheme.secondary,
                        iconArrowColor: scheme.onPrimaryContainer,
                        textColor: scheme.primary,
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            context.push(RouteLocations.guideScreen,
                                extra: index);
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Builder(builder: (context) {
              final isPro = context.watch<ProVersionProvider>().isPro;
              return Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: isPro
                    ? GuideChosePieceButton(
                        iconName: null,
                        label: l10n.partyHistoryPage,
                        isPiece: false,
                        isPartyPage: true,
                        buttonColor: scheme.onTertiaryContainer,
                        iconArrowColor: scheme.background,
                        textColor: scheme.background,
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            context.push(RouteLocations.partyHistoryScreen);
                          });
                        },
                      )
                    : ProFunctionsTooltip(
                        isPro: isPro,
                        modalHeader: l10n.partyHistoryPage,
                        child: GuideChosePieceButton(
                          iconName: null,
                          label: l10n.partyHistoryPage,
                          isPiece: false,
                          isPartyPage: true,
                          buttonColor: scheme.onTertiaryContainer,
                          iconArrowColor: ColorsConst.neutralColor100,
                          textColor: ColorsConst.neutralColor100,
                          onTap: null,
                        ),
                      ),
              );
            }),
          ],
        ),
      ),
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
