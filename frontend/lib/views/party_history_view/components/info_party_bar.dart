import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoPartyBar extends StatelessWidget {
  const InfoPartyBar({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return Container(
        height: height,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            color: scheme.onSurfaceVariant,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoBarItem(
                  text: l10n.whiteVictory,
                  iconColor: scheme.primaryContainer,
                ),
                const SizedBox(),
                InfoBarItem(
                  text: l10n.blackVictory,
                  iconColor: scheme.onSecondary,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoBarItem(
                  text: l10n.draw,
                  iconColor: scheme.onSurface,
                ),
              ],
            )
          ],
        ));
  }
}
