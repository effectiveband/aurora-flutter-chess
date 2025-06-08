import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomButtonsSection extends StatelessWidget {
  const BottomButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!context.watch<ProVersionProvider>().isPro) ...[
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
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
        ],
        if (Platform.isIOS) ...[
          SizedBox(
            width: double.infinity,
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.07,
                ),
                child: const RestorePurchasesButton()),
          )
        ]
      ],
    );
  }

  void _onDownGradeFromPro(BuildContext context) {
    context.read<ProVersionProvider>().downgradeFromPro();
    context.read<ThemeProvider>().resetTheme();
  }
}
