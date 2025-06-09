import 'package:flutter/material.dart';
import 'package:frontend/providers/pro_version_errors.dart';
import 'package:frontend/providers/pro_version_states.dart';
import 'package:frontend/repositories/in_app_purchase_repository.dart';

class ProVersionProvider extends ChangeNotifier {
  //The key of a product should be the same as an entitlement name attached to it
  static const _proVersionKey = 'chessknock_pro_version';

  late ProVersionState _state;

  final InAppPurchaseRepository _repository;

  ProVersionProvider({required InAppPurchaseRepository repository})
      : _repository = repository {
    _state = const InitialProVersionState();
    _init();
  }

  void _init() async {
    final isPro = await _repository.checkStatus(_proVersionKey);
    _setState(InitialProVersionState(isProStatus: isPro));
  }

  Future<void> upgradeToPro() async {
    try {
      await _repository.buyProduct(_proVersionKey);
      final isPro = await _repository.checkStatus(_proVersionKey);
      if (isPro) _setState(const SuccessfulPurchaseState());
    } catch (_) {
      _setState(ErrorProVersionState(
        error: ProVersionError.purchaseError,
        isProStatus: state.isProStatus,
      ));
    }
  }

  void downgradeFromPro() {
    _setState(const InitialProVersionState());
  }

  Future<void> restorePurchases() async {
    try {
      await _repository.restorePurchases();
      final isPro = await _repository.checkStatus(_proVersionKey);
      _setState(SuccessfulRestorePurchasesState(isProStatus: isPro));
    } catch (_) {
      _setState(ErrorProVersionState(
        error: ProVersionError.restoreError,
        isProStatus: state.isProStatus,
      ));
    }
  }

  void _setState(ProVersionState state) {
    _state = state;
    notifyListeners();
  }

  ProVersionState get state => _state;

  bool get isPro => state.isProStatus;
  ProVersionError? get error {
    if (state is ErrorProVersionState) {
      return (state as ErrorProVersionState).error;
    }
    return null;
  }
}
