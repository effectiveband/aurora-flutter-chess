import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:frontend/constants/assets.dart";
import "package:frontend/common/shared_functions.dart";
import "package:frontend/exports.dart";
import "package:provider/provider.dart";

class SettingsRow extends StatefulWidget {
  const SettingsRow({
    super.key,
    this.chose,
    required this.text,
    required this.modalHeader,
    this.choseDiffWidget,
    this.onChanged,
  });

  final bool? chose;
  final String text;
  final String modalHeader;
  final Widget? choseDiffWidget;
  final void Function(bool)? onChanged;

  @override
  State<SettingsRow> createState() => _SettingsRowState();
}

class _SettingsRowState extends State<SettingsRow> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isPro = context.watch<ProVersionProvider>().isPro;
    final isTablet = SharedFunctions.isTablet(context);
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
                SizedBox(width: isTablet ? 16 : 10),
                ProFunctionsTooltip(
                  isPro: isPro,
                  modalHeader: widget.modalHeader,
                  child: SvgPicture.asset(
                    Assets.questionIcon,
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
              child: ProFunctionsTooltip(
                isPro: isPro,
                modalHeader: widget.modalHeader,
                child: Switch(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: isPro ? widget.chose! : false,
                  inactiveThumbColor:
                      isPro ? scheme.surfaceTint : ColorsConst.disabledColor,
                  inactiveTrackColor: scheme.outline,
                  activeColor: scheme.inversePrimary,
                  activeTrackColor: ColorsConst.primaryColor100,
                  onChanged:
                      isPro ? (value) => widget.onChanged?.call(value) : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
