import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:frontend/exports.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:frontend/views/guide_view/models/hint_model.dart";

class GuidePieceCarousel extends StatelessWidget {
  const GuidePieceCarousel({
    super.key,
    required this.hintModel,
    required this.carouselController,
  });

  final HintModel hintModel;
  final PageController carouselController;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.04,
          ),
          child: FittedBox(
            child: Text(
              hintModel.title(l10n),
              style: TextStyles.title3.copyWith(color: scheme.primary),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            controller: carouselController,
            itemCount: hintModel.getLocalizedHints(l10n).length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/guide_boards/${hintModel.imagePaths[index]}",
                    height: MediaQuery.of(context).size.width * 0.74,
                  ),
                  HintDescription(
                    hintDesctiption: hintModel.getLocalizedHints(l10n)[index],
                    modelTitle: hintModel.title(l10n),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
