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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    final scheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scheme.background,
      body: Consumer<GameModel>(builder: (context, gameModel, child) {
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: width, minHeight: height),
            child: IntrinsicHeight(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomSwitch(provider),
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
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            MenuPageStringConst.slogan,
                            style: TextStyle(
                                fontSize: 36,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: scheme.primary),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: width * 0.2,
                                left: width * 0.2,
                                bottom: height * 0.12),
                            child: SizedBox(
                              width: double.infinity,
                              child: SvgPicture.asset(
                                "${MenuPageStringConst.pathToIcon}pieces.svg",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
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
