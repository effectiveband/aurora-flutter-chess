import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';

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
    return Column(
      children: [
        ChoseTimeCarousel(
          values: GameSettingConsts.listOfDurations,
          type: "minutes",
          header: GameSettingConsts.minutesSubtitle,
          startValue: minutesStartValue,
          onChanged: minutesOnChanged,
        ),
        ChoseTimeCarousel(
          values: GameSettingConsts.listOfAdditions,
          type: "seconds",
          header: GameSettingConsts.secondsSubtitle,
          startValue: secondsStartValue,
          onChanged: secondsOnChanged,
        )
      ],
    );
  }
}
