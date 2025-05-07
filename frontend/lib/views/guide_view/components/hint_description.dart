import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';

class HintDescription extends StatelessWidget {
  final String modelTitle;
  final String hintDesctiption;

  const HintDescription({
    super.key,
    required this.modelTitle,
    required this.hintDesctiption,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final height = MediaQuery.sizeOf(context).height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height * 0.23),
      child: FittedBox(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              modelTitle,
              textAlign: TextAlign.center,
              style: TextStyles.header2.copyWith(
                color: scheme.primary,
                height: 0.1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              hintDesctiption,
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
