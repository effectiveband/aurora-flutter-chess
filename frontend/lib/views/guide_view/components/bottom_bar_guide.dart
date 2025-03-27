import "package:flutter/material.dart";

import "../../../exports.dart";

class BottomBarGuide extends StatelessWidget {
  const BottomBarGuide(
      {super.key, required this.index, this.onForward, this.onBack});

  final int index;
  final void Function()? onForward;
  final void Function()? onBack;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height * 0.1),
      child: Container(
        width: width,
        margin: EdgeInsets.only(left: 24, right: 24, bottom: height * 0.03),
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            index > 0
                ? CustomIconButton(
                    color: scheme.surfaceVariant,
                    iconName: GuideStrings.leftArrowIcon,
                    iconSize: 40,
                    onTap: onBack,
                  )
                : const SizedBox(
                    width: 40,
                  ),
            PointsIndicator(
              count: hintsOfPieces.length,
              currentIndex: index,
            ),
            index < hintsOfPieces.length - 1
                ? CustomIconButton(
                    color: scheme.surfaceVariant,
                    iconName: GuideStrings.rightArrowIcon,
                    iconSize: 40,
                    onTap: onForward,
                  )
                : const SizedBox(
                    width: 40,
                  ),
          ],
        ),
      ),
    );
  }
}
