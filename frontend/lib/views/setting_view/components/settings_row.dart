import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:frontend/exports.dart";
import "package:provider/provider.dart";
import "package:super_tooltip/super_tooltip.dart";

class SettingsRow extends StatefulWidget {
  const SettingsRow({
    super.key,
    this.chose,
    required this.text,
    required this.modalHeader,
    this.choseDiffWidget,
    this.onChanged,
    this.forceTabletLayout,
  });

  final bool? chose;
  final String text;
  final String modalHeader;
  final Widget? choseDiffWidget;
  final void Function(bool)? onChanged;
  final bool? forceTabletLayout;

  @override
  State<SettingsRow> createState() => _SettingsRowState();
}

class _SettingsRowState extends State<SettingsRow> {
  late final SuperTooltipController _tooltipController;

  @override
  void initState() {
    super.initState();
    _tooltipController = SuperTooltipController();
  }

  @override
  void dispose() {
    _tooltipController.dispose();
    super.dispose();
  }

  bool _isTablet(BuildContext context) {
    return widget.forceTabletLayout ?? MediaQuery.of(context).size.width >= 640;
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isPro = context.watch<ProVersionProvider>().isPro;
    final isTablet = _isTablet(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  widget.text,
                  style: TextStyles.body2.copyWith(
                    color: isPro ? scheme.primary : ColorsConst.disabledColor,
                    fontSize: isTablet ? 25 : 16,
                  ),
                ),
                SizedBox(
                  width: isTablet ? 16 : 10
                ),
                ProFunctionsTooltip(
                  isPro: isPro,
                  modalHeader: widget.modalHeader,
                  controller: _tooltipController,
                  child: SvgPicture.asset(
                    "assets/images/icons/question_icon.svg",
                    colorFilter: ColorFilter.mode(
                      isPro
                            ? scheme.tertiaryContainer
                            : ColorsConst.disabledColor,
                        BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            Theme(
              data: ThemeData(useMaterial3: false),
              child: Switch(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isPro ? widget.chose! : false,
                inactiveThumbColor:
                    isPro ? scheme.surfaceTint : ColorsConst.disabledColor,
                inactiveTrackColor: scheme.outline,
                activeColor: scheme.inversePrimary,
                activeTrackColor: ColorsConst.primaryColor100,
                onChanged: (value) {
                  if (isPro) {
                    widget.onChanged?.call(value);
                  } else {
                    _tooltipController.showTooltip();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
