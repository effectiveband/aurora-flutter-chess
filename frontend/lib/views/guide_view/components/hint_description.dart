import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/exports.dart';
import 'package:frontend/views/guide_view/components/guide_constants.dart';


class HintDescription extends StatelessWidget {
  final String pieceId;
  final int hintIndex;

  const HintDescription({
    super.key,
    required this.pieceId,
    required this.hintIndex,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final height = MediaQuery.sizeOf(context).height;
    final l10n = AppLocalizations.of(context)!;

    final model = hintModels.firstWhere((e) => e.id == pieceId);
    final localizedHints = model.getLocalizedHints(l10n);

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height * 0.23),
      child: FittedBox(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              model.title(l10n),
              textAlign: TextAlign.center,
              style: TextStyles.header2.copyWith(
                color: scheme.primary,
                height: 0.1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              localizedHints[hintIndex],
              textAlign: TextAlign.center,
              softWrap: false,
              style: TextStyles.body2.copyWith(
                color: scheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
