import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../../exports.dart";
import '../menu_view/components/menu_app_bar.dart';
import '../menu_view/components/menu_button.dart';

class TabletMenuView extends StatelessWidget {
  final ThemeProvider provider;
  final ColorScheme scheme;
  final GameModel gameModel;
  final Size size;

  const TabletMenuView({
    required this.provider,
    required this.scheme,
    required this.gameModel,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: width, minHeight: height),
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 87),
                  MenuAppBar(
                    provider: provider,
                    scheme: scheme,
                    promoScreenRoute: RouteLocations.promoScreen,
                    guidebookScreenRoute: RouteLocations.guidebookScreen,
                  ),
                  SizedBox(height: height * 0.04),
                  Padding(
                    padding: aspectRatio < 0.65
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(left: 32),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: height * 0.2),
                      child: FittedBox(
                        child: Text(
                          aspectRatio < 0.65
                              ? MenuPageStringConst.slogan
                              : MenuPageStringConst.sloganWide,
                          style: TextStyles.title1.copyWith(
                            color: scheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: aspectRatio < 0.65
                          ? EdgeInsets.zero
                          : EdgeInsets.only(
                              top: height * 0.1,
                              left: width * 0.15,
                              right: width * 0.05,
                              bottom: height * 0.1),
                      child: SvgPicture.asset(
                        alignment: Alignment.bottomRight,
                        width: double.infinity,
                        "${MenuPageStringConst.pathToIcon}pieces_2.svg",
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.15),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: MenuButton(
                  gameModel: gameModel,
                  scheme: scheme,
                  height: height * 0.08,
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
