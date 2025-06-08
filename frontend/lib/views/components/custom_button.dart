import 'package:flutter/material.dart';
import 'package:frontend/constants/gradient_consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.borderRadius = 16,
    this.gradient = GradientConsts.orange,
  });

  final VoidCallback onTap;
  final Widget child;
  final double borderRadius;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient,
        ),
        child: Center(child: child),
      ),
    );
  }
}
