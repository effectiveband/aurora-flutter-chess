import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:frontend/exports.dart";
import "../guide_view.dart";

List<String> pieces = [
  "Пешка",
  "Ладья",
  "Конь",
  "Слон",
  "Ферзь",
  "Король",
  "Взятие на проходе",
  "Рокировка"
];

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
    String name = pieces[pieceIndex];
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.04),
          child: FittedBox(
            child: Text(
              name,
              style: const TextStyles().title3.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            controller: carouselController,
            itemCount: imgOfHints[name]!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/guide_boards/${imgOfHints[name]![index]}",
                    height: MediaQuery.of(context).size.width * 0.74,
                  ),
                  HintDescription(
                    text: hintsOfPieces[name]![index],
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
