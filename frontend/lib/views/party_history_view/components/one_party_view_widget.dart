import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnePartyViewWidget extends StatelessWidget {
  const OnePartyViewWidget(
      {super.key, required this.partyData, required this.isComputer});

  final Map partyData;
  final bool isComputer;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    Map<String, Color> computerListOfColorsIcons = {
      l10n.victory: scheme.onSecondaryContainer,
      l10n.defeat: scheme.primary,
      l10n.draw: ColorsConst.secondaryColor100
    };

    Map<String, Color> friendListOfColorsIcons = {
      l10n.whiteVictory: scheme.primaryContainer,
      l10n.blackVictory: scheme.onSecondary,
      l10n.draw: scheme.onSurface
    };
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            PartyHistoryConst.infoPartyIconName,
            height: 35,
            width: 35,
            colorFilter: ColorFilter.mode(
                isComputer
                    ? computerListOfColorsIcons[partyData["result"]]!
                    : friendListOfColorsIcons[partyData["result"]]!,
                BlendMode.srcIn),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                partyData["date"],
                style: TextStyles.header2.copyWith(
                  color: scheme.primary,
                ),
              ),
              Text(
                partyData["time"],
                style: TextStyles.body2.copyWith(
                  color: scheme.primary,
                ),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: isComputer
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      partyData["durationGame"] != "00:00"
                          ? l10n.duration
                          : l10n.withoutTimer,
                      style: TextStyles.caption1.copyWith(
                        color: scheme.error,
                        height: 1,
                      ),
                    ),
                    isComputer
                        ? Text(
                            l10n.pieceColor,
                            style: TextStyles.caption1.copyWith(
                              color: scheme.error,
                              height: 1,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: isComputer
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      partyData["durationGame"] != "00:00"
                          ? Text(
                              partyData["durationGame"].toString(),
                              style: TextStyles.caption1.copyWith(
                                color: scheme.error,
                                height: 1,
                              ),
                            )
                          : const SizedBox(),
                      isComputer
                          ? Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: partyData["color"] == l10n.whitePieces
                                      ? scheme.inverseSurface
                                      : ColorsConst.neutralColor100),
                            )
                          : const SizedBox()
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
