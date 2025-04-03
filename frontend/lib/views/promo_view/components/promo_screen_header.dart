import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:go_router/go_router.dart';

class PromoScreenHeader extends StatelessWidget {
  const PromoScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        CustomIconButton(
          iconName: "assets/images/icons/left_big_arrow_icon.svg",
          color: scheme.onTertiary,
          iconSize: 40,
          onTap: () {
            context.pop();
          },
        ),
        Center(
          child: Text(
            PromoPageConstants.proVersion,
            style: const TextStyles()
                .header2
                .copyWith(color: scheme.primary, height: 1.3),
          ),
        ),
      ],
    );
  }
}
