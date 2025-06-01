import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PromoScreenHeader extends StatelessWidget {
  const PromoScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.03),
      child: Stack(
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
            child: FittedBox(
              child: Text(
                AppLocalizations.of(context).proVersion,
                style: TextStyles.header2
                    .copyWith(color: scheme.primary, height: 1.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
