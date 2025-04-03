import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/exports.dart';

class PromoFeatureCard extends StatelessWidget {
  const PromoFeatureCard({
    super.key,
    this.headerText,
    required this.descriptionText,
    required this.columnAlignment,
    required this.gradient,
    this.backgroundImages,
  });

  final String? headerText;
  final String descriptionText;
  final CrossAxisAlignment columnAlignment;
  final LinearGradient gradient;
  final List<SvgPicture>? backgroundImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), gradient: gradient),
            child: Stack(
              alignment: columnAlignment == CrossAxisAlignment.start
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              fit: StackFit.loose,
              children: [
                if (backgroundImages != null) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: backgroundImages!,
                  )
                ],
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: columnAlignment,
                      children: [
                        if (headerText != null) ...[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(headerText!,
                                style: const TextStyles().header2.copyWith(
                                    color: ColorsConst.neutralColor0,
                                    height: 1.3)),
                          )
                        ],
                        Text(
                          descriptionText,
                          textAlign: columnAlignment == CrossAxisAlignment.start
                              ? TextAlign.start
                              : TextAlign.end,
                          style: const TextStyles().body2.copyWith(
                              color: ColorsConst.neutralColor0, height: 1.3),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
