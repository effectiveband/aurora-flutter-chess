import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';

class SettingsRowsSection extends StatelessWidget {
  const SettingsRowsSection(
      {super.key,
      required this.choseMoveBack,
      required this.moveBackOnChanged,
      required this.choseThreats,
      required this.threatsOnChanged,
      required this.choseHints,
      required this.hintsOnChanged});

  final bool choseMoveBack;
  final void Function(bool)? moveBackOnChanged;
  final bool choseThreats;
  final void Function(bool)? threatsOnChanged;
  final bool choseHints;
  final void Function(bool)? hintsOnChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsRow(
          chose: choseMoveBack,
          text: GameSettingConsts.moveBackText,
          modalHeader: ModalStrings.moveBackModalText,
          onChanged: moveBackOnChanged,
        ),
        SettingsRow(
          chose: choseThreats,
          text: GameSettingConsts.threatsText,
          modalHeader: ModalStrings.threatsModalText,
          onChanged: threatsOnChanged,
        ),
        SettingsRow(
          chose: choseHints,
          text: GameSettingConsts.hintsText,
          modalHeader: ModalStrings.hintsModalText,
          onChanged: hintsOnChanged,
        )
      ],
    );
  }
}
