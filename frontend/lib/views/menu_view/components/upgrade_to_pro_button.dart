import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/exports.dart';

class UpgradeToProButton extends StatelessWidget {
  const UpgradeToProButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 16,
          right: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(255, 190, 146, 1),
              Color.fromRGBO(220, 101, 35, 1)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Row(
          children: [
            Text(
              'Стать Pro',
              style: const TextStyles()
                  .body2
                  .copyWith(color: ColorsConst.neutralColor0),
            ),
            SvgPicture.asset(
              'assets/images/icons/pro_sparkles.svg',
              colorFilter: const ColorFilter.mode(
                  ColorsConst.neutralColor0, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }
}
