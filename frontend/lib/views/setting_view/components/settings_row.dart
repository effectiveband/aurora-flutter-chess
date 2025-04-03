import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:frontend/exports.dart";
import "package:provider/provider.dart";

class SettingsRow extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isPro = context.watch<ProVersionProvider>().isPro;
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
                  text,
                  style: TextStyle(
                    color: isPro ? scheme.primary : ColorsConst.disabledColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ProFunctionsTooltip(
                  isPro: isPro,
                  modalHeader: modalHeader,
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
                value: isPro ? chose! : false,
                inactiveThumbColor:
                    isPro ? scheme.surfaceTint : ColorsConst.disabledColor,
                inactiveTrackColor: scheme.outline,
                activeColor: scheme.inversePrimary,
                activeTrackColor: ColorsConst.primaryColor100,
                onChanged: onChanged,
              ),
            )
          ],
        ),
      ),
    );
  }
}
