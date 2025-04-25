import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:frontend/exports.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:frontend/views/guide_view/components/guide_constants.dart";

class GuidePieceCarousel extends StatelessWidget {
  const GuidePieceCarousel({
    super.key,
    required this.pieceIndex,
    required this.index,
    required this.carouselController,
  });

  final int index;
  final int pieceIndex;
  final PageController carouselController;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final model = hintModels[pieceIndex];
    final title = model.title(l10n);
    final hints = model.getLocalizedHints(l10n);
    final images = model.imagePaths;

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.04,
          ),
          child: FittedBox(
            child: Text(
              title,
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
            itemCount: hints.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/guide_boards/${images[index]}",
                    height: MediaQuery.of(context).size.width * 0.74,
                  ),
                  HintDescription(
                    pieceId: model.id,
                    hintIndex: index,
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
