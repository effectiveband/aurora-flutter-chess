import 'package:flutter/material.dart';
import 'package:frontend/common/shared_functions.dart';
import 'package:frontend/exports.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RestorePurchasesButton extends StatelessWidget {
  const RestorePurchasesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProVersionProvider>();
    if (provider.isRestoreError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SharedFunctions.showSnackBar(
            context, AppLocalizations.of(context).restorePurchasesError);
      });
    }
    return CustomButton(
        gradient: GradientConsts.grey,
        onTap: context.read<ProVersionProvider>().restorePurchases,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            AppLocalizations.of(context).restorePurchases,
            style:
                TextStyles.header1.copyWith(color: ColorsConst.neutralColor0),
          ),
        ));
  }
}
