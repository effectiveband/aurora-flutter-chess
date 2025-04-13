import "package:frontend/exports.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class AppBarGuide extends StatelessWidget {
  const AppBarGuide(
      {super.key,
      required this.isMainGuide,
      required this.iconName,
      required this.iconColor,
      required this.bottomMargin,
      required this.header});

  final bool isMainGuide;
  final String iconName;
  final Color iconColor;
  final double bottomMargin;
  final String header;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height * 0.12),
      child: FittedBox(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isMainGuide
                  ? const SizedBox(
                      width: 42,
                    )
                  : CustomIconButton(
                      iconName: iconName,
                      color: iconColor,
                      iconSize: 42,
                      onTap: () {
                        context.pop();
                      },
                    ),
              Text(
                header,
                style: TextStyles.header2.copyWith(
                  color: scheme.surface,
                  height: 0.05,
                ),
              ),
              isMainGuide
                  ? CustomIconButton(
                      iconName: iconName,
                      color: iconColor,
                      iconSize: 42,
                      onTap: () {
                        context.pop();
                      },
                    )
                  : const SizedBox(
                      width: 42,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
