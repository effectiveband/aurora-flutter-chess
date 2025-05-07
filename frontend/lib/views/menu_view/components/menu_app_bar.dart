import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    final scheme = Theme.of(context).colorScheme;
    final isPro = context.watch<ProVersionProvider>().isPro;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isPro
            ? Row(
                children: [
                  CustomSwitch(provider),
                  const SizedBox(width: 16),
                  ProStatusIndicator(onTap: () => context.push(promoScreenRoute)),
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
