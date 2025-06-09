import 'package:flutter/material.dart';
import 'package:frontend/common/shared_functions.dart';
import 'package:frontend/exports.dart';
import 'package:frontend/providers/pro_version_errors.dart';
import 'package:frontend/providers/pro_version_states.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RestorePurchasesButton extends StatelessWidget {
  const RestorePurchasesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProVersionProvider>();
    provider.addListener(() {
      _onListenProvider(context);
    });

    return CustomButton(
        gradient: GradientConsts.grey,
        onTap: provider.restorePurchases,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            AppLocalizations.of(context).restorePurchases,
            style:
                TextStyles.header1.copyWith(color: ColorsConst.neutralColor0),
          ),
        ));
  }

  void _onListenProvider(BuildContext context) {
    final provider = context.read<ProVersionProvider>();
    if (provider.error == ProVersionError.restoreError) {
      SharedFunctions.showSnackBar(
          context, AppLocalizations.of(context).restorePurchasesError);
    }
    if (provider.state is SuccessfulRestorePurchasesState) {
      SharedFunctions.showSnackBar(
          context, AppLocalizations.of(context).restorePurchasesCompleted);
    }
  }
}
