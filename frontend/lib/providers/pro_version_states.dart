import 'package:frontend/providers/pro_version_errors.dart';

sealed class ProVersionState {
  final bool isProStatus;

  const ProVersionState({
    required this.isProStatus,
  });
}

class InitialProVersionState extends ProVersionState {
  const InitialProVersionState({super.isProStatus = false});
}

class ErrorProVersionState extends ProVersionState {
  ErrorProVersionState({required this.error, required super.isProStatus});

  final ProVersionError error;
}

class SuccessfulRestorePurchasesState extends ProVersionState {
  SuccessfulRestorePurchasesState({required super.isProStatus});
}

class SuccessfulPurchaseState extends ProVersionState {
  const SuccessfulPurchaseState({super.isProStatus = true});
}
