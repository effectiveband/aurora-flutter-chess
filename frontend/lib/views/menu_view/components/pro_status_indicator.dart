import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProStatusIndicator extends StatelessWidget {
  const ProStatusIndicator({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ShaderMask(
              shaderCallback: (Rect bounds) {
                return GradientConsts.orange.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height));
              },
              child: Text(
                AppLocalizations.of(context)!.pro,
                style:
                    TextStyles.body1.copyWith(color: ColorsConst.neutralColor0),
              )),
          ShaderMask(
              shaderCallback: (Rect bounds) {
                return GradientConsts.orange.createShader(
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
