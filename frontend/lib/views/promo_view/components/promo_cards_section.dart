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
          gradient: LinearGradient(
            colors: [
              context.read<ThemeProvider>().isDarkMode
                  ? const Color.fromRGBO(52, 49, 46, 1)
                  : const Color.fromRGBO(31, 26, 22, 1),
              context.read<ThemeProvider>().isDarkMode
                  ? const Color.fromRGBO(153, 148, 144, 1)
                  : const Color.fromRGBO(126, 113, 102, 1)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          headerText: 'Смена темы приложения',
          descriptionText: 'Настраивай приложение \nпод себя в один клик',
          columnAlignment: CrossAxisAlignment.end,
          backgroundImages: [
            SvgPicture.asset(
              'assets/images/icons/sun.svg',
            ),
            SvgPicture.asset('assets/images/icons/moon.svg')
          ],
        ),
        PromoFeatureCard(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(220, 101, 35, 1),
              Color.fromRGBO(255, 190, 146, 1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          headerText: 'Персональный режим',
          descriptionText: 'Настраивай параметры \nи собирай свой режим игры',
          columnAlignment: CrossAxisAlignment.start,
          backgroundImages: [
            SvgPicture.asset(
              'assets/images/icons/chess_piece.svg',
            )
          ],
        ),
        Row(
          children: [
            Expanded(
                child: PromoFeatureCard(
              descriptionText: 'Угрозы \nвашим фигурам',
              columnAlignment: CrossAxisAlignment.start,
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(220, 101, 35, 1),
                  Color.fromRGBO(255, 190, 146, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              backgroundImages: [
                SvgPicture.asset(
                  'assets/images/icons/explosion.svg',
                )
              ],
            )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: PromoFeatureCard(
              descriptionText: 'Подсказки \nво время игры',
              columnAlignment: CrossAxisAlignment.start,
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(220, 101, 35, 1),
                  Color.fromRGBO(255, 190, 146, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              backgroundImages: [
                SvgPicture.asset(
                  'assets/images/icons/lamp.svg',
                )
              ],
            ))
          ],
        ),
        PromoFeatureCard(
          headerText: 'История партий',
          descriptionText: 'Смотри историю \nсыгранных партий',
          columnAlignment: CrossAxisAlignment.end,
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(128, 108, 97, 1),
              Color.fromARGB(255, 182, 171, 156)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
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
