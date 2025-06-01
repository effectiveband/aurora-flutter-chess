import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/exports.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PromoCardsSection extends StatelessWidget {
  const PromoCardsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        PromoFeatureCard(
          gradient: context.read<ThemeProvider>().isDarkMode
              ? GradientConsts.grey
              : GradientConsts.greyAlt,
          headerText: l10n.themeSwitchHeader,
          descriptionText: l10n.themeSwitchDescription,
          columnAlignment: CrossAxisAlignment.end,
          backgroundImages: [
            SvgPicture.asset(
              'assets/images/icons/sun.svg',
            ),
            SvgPicture.asset('assets/images/icons/moon.svg')
          ],
        ),
        const SizedBox(height: 10),
        PromoFeatureCard(
          gradient: GradientConsts.orange,
          headerText: l10n.personalModeHeader,
          descriptionText: l10n.personalModeDescription,
          columnAlignment: CrossAxisAlignment.start,
          backgroundImages: [
            SvgPicture.asset(
              'assets/images/icons/chess_piece.svg',
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: PromoFeatureCard(
              descriptionText: l10n.threatsPromoDescription,
              columnAlignment: CrossAxisAlignment.start,
              gradient: GradientConsts.orange,
              backgroundImages: [
                SvgPicture.asset(
                  'assets/images/icons/explosion.svg',
                )
              ],
            )),
            const SizedBox(width: 10),
            Expanded(
                child: PromoFeatureCard(
              descriptionText: l10n.hintsPromoDescription,
              columnAlignment: CrossAxisAlignment.start,
              gradient: GradientConsts.orange,
              backgroundImages: [
                SvgPicture.asset(
                  'assets/images/icons/lamp.svg',
                )
              ],
            ))
          ],
        ),
        const SizedBox(height: 10),
        PromoFeatureCard(
          headerText: l10n.gamesHistoryHeader,
          descriptionText: l10n.gamesHistoryDescription,
          columnAlignment: CrossAxisAlignment.end,
          gradient: GradientConsts.lightGrey,
          backgroundImages: [
            SvgPicture.asset(
              'assets/images/icons/book.svg',
            )
          ],
        ),
      ],
    );
  }
}
