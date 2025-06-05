import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/exports.dart';

class InfoBarItem extends StatelessWidget {
  const InfoBarItem({super.key, required this.text, required this.iconColor});

  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          PartyHistoryConst.infoPartyIconName,
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyles.caption2.copyWith(
            color: Theme.of(context).colorScheme.primary,
            height: 0.09,
          ),
        ),
      ],
    );
  }
}
