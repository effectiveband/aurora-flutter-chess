import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PromoPageView extends StatelessWidget {
  const PromoPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: MediaQuery.sizeOf(context).height * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PromoScreenHeader(),
            const PromoCardsSection(),
            SizedBox(
              width: double.infinity,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.07,
                ),
                child: UpgradeToProButton(
                    onTap: () {
                      context.read<ProVersionProvider>().isPro
                          ? _onDownGradeFromPro(context)
                          : context.read<ProVersionProvider>().upgradeToPro();
                      context.pop();
                    },
                    price: AppLocalizations.of(context).price),
              ),
            )
          ],
        ),
      )),
    );
  }

  void _onDownGradeFromPro(BuildContext context) {
    context.read<ProVersionProvider>().downgradeFromPro();
    context.read<ThemeProvider>().resetTheme();
  }
}
