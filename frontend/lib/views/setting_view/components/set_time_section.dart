import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetTimeSection extends StatelessWidget {
  const SetTimeSection(
      {super.key,
      required this.minutesStartValue,
      required this.minutesOnChanged,
      required this.secondsStartValue,
      required this.secondsOnChanged});

  final dynamic minutesStartValue;
  final void Function(dynamic)? minutesOnChanged;
  final dynamic secondsStartValue;
  final void Function(dynamic)? secondsOnChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        ChoseTimeCarousel(
          values: GameSettingConsts.listOfDurations,
          type: "minutes",
          header: l10n.minutesPerGame,
          startValue: minutesStartValue,
          onChanged: minutesOnChanged,
        ),
        ChoseTimeCarousel(
          values: GameSettingConsts.listOfAdditions,
          type: "seconds",
          header: l10n.secondsPerMove,
          startValue: secondsStartValue,
          onChanged: secondsOnChanged,
        )
      ],
    );
  }
}
