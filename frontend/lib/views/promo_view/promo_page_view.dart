import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';

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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PromoScreenHeader(),
            PromoCardsSection(),
            BottomButtonsSection(),
          ],
        ),
      )),
    );
  }
}
