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
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
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
                        : const EdgeInsets.only(left: 15),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: height * 0.2,
                        maxWidth: width * 0.8, // Ограничение ширины до 80% экрана
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          aspectRatio < 0.65
                              ? MenuPageStringConst.slogan
                              : MenuPageStringConst.sloganWide,
                          style: TextStyles.title1.copyWith(
                            color: scheme.primary,
                            fontSize: TextStyles.title1.fontSize! * 1.9,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.7,
                    margin: EdgeInsets.only(bottom: height * 0.01),
                    child: SvgPicture.asset(
                      "${MenuPageStringConst.pathToIcon}pieces.svg",
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: MenuButton(
                  gameModel: gameModel,
                  scheme: scheme,
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
