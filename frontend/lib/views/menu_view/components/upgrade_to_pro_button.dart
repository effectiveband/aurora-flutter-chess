import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/exports.dart';
import 'package:provider/provider.dart';

class UpgradeToProButton extends StatelessWidget {
  const UpgradeToProButton({
    super.key,
    required this.onTap,
    this.price,
  });

  final VoidCallback onTap;
  final int? price;

  @override
  Widget build(BuildContext context) {
    final isExtended =
        context.read<ProVersionProvider>().isPro || price != null;
    final style = isExtended
        ? const TextStyles().header1.copyWith(color: ColorsConst.neutralColor0)
        : const TextStyles().body2.copyWith(color: ColorsConst.neutralColor0);
    final padding = isExtended
        ? const EdgeInsets.symmetric(vertical: 16)
        : const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 16,
            right: 12,
          );
    final double iconSize = isExtended ? 29 : 24;
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isExtended ? 16 : 24),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(255, 190, 146, 1),
              Color.fromRGBO(220, 101, 35, 1)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  return Text(
                    context.watch<ProVersionProvider>().isPro
                        ? StringConstants.downgradeFromPro
                        : StringConstants.becomePro,
                    style: style,
                  );
                }),
                SvgPicture.asset(
                  fit: BoxFit.fill,
                  height: iconSize,
                  width: iconSize,
                  'assets/images/icons/pro_sparkles.svg',
                  colorFilter: const ColorFilter.mode(
                      ColorsConst.neutralColor0, BlendMode.srcIn),
                ),
                if (price != null) ...[
                  Text(
                    '$price ₽',
                    style: style,
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
