import 'package:flutter/material.dart';
import 'package:frontend/common/shared_functions.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../exports.dart';

class MenuAppBar extends StatelessWidget {
  final String promoScreenRoute;
  final String guidebookScreenRoute;

  const MenuAppBar({
    required this.promoScreenRoute,
    required this.guidebookScreenRoute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final provider = context.watch<ProVersionProvider>();
    final isPro = provider.isPro;
    if (provider.isPurchaseError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SharedFunctions.showSnackBar(
            context, AppLocalizations.of(context).purchaseError);
      });
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isPro
            ? Row(
                children: [
                  CustomSwitch(
                      Provider.of<ThemeProvider>(context, listen: false)),
                  const SizedBox(width: 16),
                  const ProStatusIndicator(),
                ],
              )
            : UpgradeToProButton(onTap: () => context.push(promoScreenRoute)),
        ButtonToGuide(
          backGroundColor: scheme.secondaryContainer,
          height: 55,
          width: 55,
          onTap: () => context.push(guidebookScreenRoute),
        ),
      ],
    );
  }
}
