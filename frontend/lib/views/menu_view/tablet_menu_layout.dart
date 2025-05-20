import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../../exports.dart";
import '../menu_view/components/menu_app_bar.dart';
import '../menu_view/components/menu_button.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class TabletMenuView extends StatelessWidget {
  final GameModel gameModel;
  final Size size;

  const TabletMenuView({
    required this.gameModel,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: width, minHeight: height),
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  MenuAppBar(
                    promoScreenRoute: RouteLocations.promoScreen,
                    guidebookScreenRoute: RouteLocations.guidebookScreen,
                  ),
                  SizedBox(height: height * 0.04),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: height * 0.2,
                      maxWidth: width * 0.8,
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n.sloganWide,
                        style: TextStyles.title1.copyWith(
                          color: colorScheme.primary,
                          fontSize: TextStyles.title1.fontSize! * 1.9,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Positioned(
                bottom: height * 0.01,
                right: 0,
                child: SizedBox(
                  width: width * 0.9,
                  height: height * 0.7,
                  child: SvgPicture.asset(
                    "${MenuPageStringConst.pathToIcon}pieces.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: MenuButton(
                  gameModel: gameModel,
                  height: height * 0.24,
                  buttonText: MenuPageStringConst.localButton,
                  settingsScreenRoute: RouteLocations.settingsScreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
