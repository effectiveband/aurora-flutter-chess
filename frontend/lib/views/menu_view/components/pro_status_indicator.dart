import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/constants/assets.dart';
import 'package:frontend/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ProStatusIndicator extends StatelessWidget {
  const ProStatusIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          (Platform.isIOS) ? context.push(RouteLocations.promoScreen) : null,
      child: Row(
        children: [
          ShaderMask(
              shaderCallback: (Rect bounds) {
                return GradientConsts.orange.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height));
              },
              child: Text(
                AppLocalizations.of(context).pro,
                style:
                    TextStyles.body1.copyWith(color: ColorsConst.neutralColor0),
              )),
          ShaderMask(
              shaderCallback: (Rect bounds) {
                return GradientConsts.orange.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height));
              },
              child: SvgPicture.asset(
                Assets.proSparkles,
              )),
        ],
      ),
    );
  }
}
