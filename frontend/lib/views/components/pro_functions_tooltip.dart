import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:super_tooltip/super_tooltip.dart';

class ProFunctionsTooltip extends StatelessWidget {
  const ProFunctionsTooltip({
    super.key,
    required this.modalHeader,
    required this.child,
    required this.isPro,
  });

  final String modalHeader;
  final Widget child;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      hideTooltipOnTap: true,
      hideTooltipOnBarrierTap: true,
      backgroundColor: Colors.white,
      borderColor: Colors.white,
      hasShadow: false,
      borderRadius: 16,
      showBarrier: true,
      barrierColor: Colors.transparent,
      popupDirection: TooltipDirection.up,
      content: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                modalHeader,
                style: const TextStyles().body2.copyWith(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(StringConstants.proVersionAvailability),
              ),
              !isPro
                  ? UpgradeToProButton(onTap: () {})
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
      child: child,
    );
  }
}
