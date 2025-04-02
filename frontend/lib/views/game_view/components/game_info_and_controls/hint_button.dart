import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/exports.dart';

class HintButton extends StatelessWidget {
  const HintButton(
      {super.key,
      this.onPressed,
      required this.enabled,
      this.lampColor,
      this.hintAnimationColor});

  final VoidCallback? onPressed;
  final bool enabled;
  final Color? lampColor;
  final Color? hintAnimationColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: enabled
            ? Theme.of(context).colorScheme.onInverseSurface
            : ColorsConst.disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: hintAnimationColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(90),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              GamePageConst.lampIcon,
              colorFilter: ColorFilter.mode(
                  lampColor ?? ColorsConst.neutralColor100, BlendMode.srcIn),
            ),
            highlightColor: Colors.white.withOpacity(0.3),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
