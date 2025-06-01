import 'package:flutter/material.dart';
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            content: Text(
              AppLocalizations.of(context).purchaseError,
              style: TextStyles.caption2,
            ),
            duration: const Duration(seconds: 2),
          ),
        );
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
