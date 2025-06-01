import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/constants/assets.dart';
import '../../../exports.dart';

class PieceChooseWindow extends StatelessWidget {
  final GameModel gameModel;
  const PieceChooseWindow(this.gameModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return Container(
      width: 245,
      height: 275,
      decoration: ShapeDecoration(
        color: scheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              l10n.choosePiece,
              textAlign: TextAlign.center,
              style: TextStyles.header2.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        AssetsPieces.bishop,
                        width: 55,
                        height: 55,
                        colorFilter:
                            ColorFilter.mode(scheme.primary, BlendMode.srcIn),
                      ),
                      highlightColor: scheme.errorContainer,
                      onPressed: () => gameModel.setPieceForPromotion(
                        ChessPieceType.bishop,
                      ),
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        AssetsPieces.rook,
                        width: 55,
                        height: 55,
                        colorFilter:
                            ColorFilter.mode(scheme.primary, BlendMode.srcIn),
                      ),
                      highlightColor: scheme.errorContainer,
                      onPressed: () => gameModel.setPieceForPromotion(
                        ChessPieceType.rook,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        AssetsPieces.knight,
                        width: 55,
                        height: 55,
                        colorFilter:
                            ColorFilter.mode(scheme.primary, BlendMode.srcIn),
                      ),
                      highlightColor: scheme.errorContainer,
                      onPressed: () => gameModel.setPieceForPromotion(
                        ChessPieceType.knight,
                      ),
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        AssetsPieces.queen,
                        width: 55,
                        height: 55,
                        colorFilter:
                            ColorFilter.mode(scheme.primary, BlendMode.srcIn),
                      ),
                      highlightColor: scheme.errorContainer,
                      onPressed: () => gameModel.setPieceForPromotion(
                        ChessPieceType.queen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
