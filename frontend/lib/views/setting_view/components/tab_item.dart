import "package:flutter/material.dart";
import "package:frontend/exports.dart";

class TabItem extends StatelessWidget {
  final String title;
  final int index;
  final int currentIndex;

  const TabItem({
    super.key,
    required this.title,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.body2.copyWith(
              color: index == currentIndex
                  ? ColorsConst.neutralColor0
                  : scheme.tertiary,
              height: 0.08,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
