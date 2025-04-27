import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import "../../exports.dart";

class TabletMenuView extends StatelessWidget {
  final ThemeProvider provider;
  final ColorScheme scheme;
  final GameModel gameModel;

  const TabletMenuView({
    required this.provider,
    required this.scheme,
    required this.gameModel,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Builder(builder: (context) {
                final isPro = context.watch<ProVersionProvider>().isPro;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isPro
                        ? Row(
                            children: [
                              CustomSwitch(provider),
                              const SizedBox(width: 16),
                              ProStatusIndicator(
                                  onTap: () =>
                                      context.push(RouteLocations.promoScreen)),
                            ],
                          )
                        : UpgradeToProButton(onTap: () {
                            context.push(RouteLocations.promoScreen);
                          }),
                    ButtonToGuide(
                      backGroundColor: scheme.secondaryContainer,
                      height: 40,
                      width: 40,
                      onTap: () {
                        context.push(RouteLocations.guidebookScreen);
                      },
                    ),
                  ],
                );
              }),
              SizedBox(height: height * 0.04),
              Padding(
                padding: aspectRatio < 0.65
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(left: 15),
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
                          bottom: height * 0.03),
                  child: SvgPicture.asset(
                    alignment: Alignment.bottomRight,
                    width: double.infinity,
                    "${MenuPageStringConst.pathToIcon}pieces.svg",
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: height * 0.08),
                    child: NextPageButton(
                      text: MenuPageStringConst.localButton,
                      textColor: ColorsConst.primaryColor0,
                      buttonColor: scheme.secondaryContainer,
                      isClickable: true,
                      onTap: () {
                        context.go(RouteLocations.settingsScreen,
                            extra: gameModel);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
