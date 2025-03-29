import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import "../../exports.dart";

class MyMenuView extends StatefulWidget {
  static MyMenuView builder(BuildContext context, GoRouterState state) =>
      const MyMenuView();
  const MyMenuView({super.key});

  @override
  State<MyMenuView> createState() => _MyMenuViewState();
}

class _MyMenuViewState extends State<MyMenuView> {
  @override
  initState() {
    super.initState();
  }

  //временное решение для верстки
  bool isPro = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    final scheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return Scaffold(
      backgroundColor: scheme.background,
      body: Consumer<GameModel>(builder: (context, gameModel, child) {
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: width, minHeight: height),
            child: IntrinsicHeight(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isPro
                            ? Row(
                                children: [
                                  CustomSwitch(provider),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const ProStatusIndicator(),
                                ],
                              )
                            : UpgradeToProButton(onTap: () {
                                setState(() {
                                  isPro = !isPro;
                                });
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
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Padding(
                      padding: aspectRatio < 0.8
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(left: 15),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: height * 0.2),
                        child: FittedBox(
                          child: Text(
                            aspectRatio < 0.8
                                ? MenuPageStringConst.slogan
                                : MenuPageStringConst.sloganWide,
                            style: TextStyle(
                                fontSize: 36,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: scheme.primary),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: aspectRatio < 0.8
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
          ),
        );
      }),
    );
  }
}
