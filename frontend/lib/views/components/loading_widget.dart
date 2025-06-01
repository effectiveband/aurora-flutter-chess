import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:frontend/constants/assets.dart";
import "package:frontend/exports.dart";

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: scheme.background,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.loading,
              colorFilter: ColorFilter.mode(scheme.primary, BlendMode.srcIn),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "ChessKnock",
              textAlign: TextAlign.center,
              style: TextStyles.title1.copyWith(
                color: scheme.primary,
                fontSize: 50,
              ),
            )
          ],
        )),
      ),
    );
  }
}
