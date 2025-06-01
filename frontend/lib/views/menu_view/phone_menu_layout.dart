import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../../exports.dart";
import '../menu_view/components/menu_app_bar.dart';
import '../menu_view/components/menu_button.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class PhoneMenuView extends StatelessWidget {
  final GameModel gameModel;
  final Size size;

  const PhoneMenuView({
    required this.gameModel,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: width, minHeight: height),
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              MenuAppBar(
                promoScreenRoute: RouteLocations.promoScreen,
                guidebookScreenRoute: RouteLocations.guidebookScreen,
              ),
              SizedBox(height: height * 0.04),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: height * 0.2),
                  child: FittedBox(
                    child: Text(
                      l10n.slogan,
                      style: TextStyles.title1.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  alignment: Alignment.bottomRight,
                  width: double.infinity,
                  "${MenuPageStringConst.pathToIcon}pieces.svg",
                ),
              ),
              MenuButton(
                gameModel: gameModel,
                height: height,
                buttonText: l10n.startGame,
                settingsScreenRoute: RouteLocations.settingsScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
