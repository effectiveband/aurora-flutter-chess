import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:provider/provider.dart';
import 'package:super_tooltip/super_tooltip.dart';

class ProFunctionsTooltip extends StatefulWidget {
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
  State<ProFunctionsTooltip> createState() => _ProFunctionsTooltipState();
}

class _ProFunctionsTooltipState extends State<ProFunctionsTooltip> {
  final _controller = SuperTooltipController();

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      controller: _controller,
      arrowTipRadius: 2,
      arrowBaseWidth: 30,
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
                widget.modalHeader,
                style: const TextStyles().body2.copyWith(
                      color: ColorsConst.neutralColor300,
                      height: 1.3,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  StringConstants.proVersionAvailability,
                  style: const TextStyles().caption1.copyWith(
                        color: ColorsConst.neutralColor100,
                        height: 1.3,
                      ),
                ),
              ),
              !widget.isPro
                  ? UpgradeToProButton(
                      onTap: context.read<ProVersionProvider>().upgradeToPro)
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
      child: widget.child,
    );
  }
}
