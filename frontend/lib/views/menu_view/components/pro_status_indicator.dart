import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/exports.dart';

class ProStatusIndicator extends StatelessWidget {
  const ProStatusIndicator({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      colors: [
        Color.fromRGBO(255, 190, 146, 1),
        Color.fromRGBO(220, 101, 35, 1)
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ShaderMask(
              shaderCallback: (Rect bounds) {
                return gradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height));
              },
              child: Text(
                'Pro',
                style: const TextStyles()
                    .body1
                    .copyWith(color: ColorsConst.neutralColor0),
              )),
          ShaderMask(
              shaderCallback: (Rect bounds) {
                return gradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height));
              },
              child: SvgPicture.asset(
                'assets/images/icons/pro_sparkles.svg',
              )),
        ],
      ),
    );
  }
}
