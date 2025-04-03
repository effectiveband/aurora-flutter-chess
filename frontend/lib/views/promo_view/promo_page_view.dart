import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
              child: UpgradeToProButton(
                onTap: () {
                  context.read<ProVersionProvider>().isPro
                      ? context.read<ProVersionProvider>().downgradeFromPro()
                      : context.read<ProVersionProvider>().upgradeToPro();
                  context.pop();
                },
                price: context.read<ProVersionProvider>().isPro
                    ? null
                    : PromoPageConstants.proVersionPrice,
              ),
            )
          ],
        ),
      )),
    );
  }
}
