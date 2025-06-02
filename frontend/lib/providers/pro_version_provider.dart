import 'package:flutter/material.dart';
import 'package:frontend/repositories/in_app_purchase_repository.dart';

class ProVersionProvider extends ChangeNotifier {
  //The key of a product should be the same as an entitlement name attached to it
  static const _proVersionKey = 'chessknock_pro_version';

  bool _isProStatus = false;
  bool _isPurchaseError = false;

  final InAppPurchaseRepository _repository;

  ProVersionProvider({required InAppPurchaseRepository repository})
      : _repository = repository {
    _init();
  }

  void _init() async {
    _repository.init();
    _setProStatus(_repository.getStatus());
  }

  void _setProStatus(bool status) {
    _isProStatus = status;
    notifyListeners();
  }

  void _setPurchaseError(bool isError) {
    _isPurchaseError = isError;
    notifyListeners();
  }

  Future<void> upgradeToPro() async {
    try {
      await _repository.buyProduct(_proVersionKey);
      final isPro = _repository.getStatus();
      _setProStatus(isPro);
      _setPurchaseError(false);
    } catch (_) {
      _setPurchaseError(true);
      await Future.delayed(const Duration(milliseconds: 100));
      _setPurchaseError(false);
    }
  }

  void downgradeFromPro() {
    _setProStatus(false);
  }

  bool get isPro => _isProStatus;
  bool get isPurchaseError => _isPurchaseError;
}
