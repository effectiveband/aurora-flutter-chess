import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/exports.dart';
import 'package:provider/provider.dart';

class PromoCardsSection extends StatelessWidget {
  const PromoCardsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PromoFeatureCard(
          gradient: context.read<ThemeProvider>().isDarkMode
              ? GradientConsts.grey
              : GradientConsts.greyAlt,
          headerText: PromoPageConstants.themeSwitchHeader,
          descriptionText: PromoPageConstants.themeSwitchDescription,
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
          headerText: PromoPageConstants.personalModeHeader,
          descriptionText: PromoPageConstants.personalModeDescription,
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
              descriptionText: PromoPageConstants.threatsDescription,
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
              descriptionText: PromoPageConstants.hintsDesctiption,
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
          headerText: PromoPageConstants.gamesHistoryHeader,
          descriptionText: PromoPageConstants.gamesHistoryDescription,
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
