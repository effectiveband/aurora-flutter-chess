import 'package:flutter/material.dart';
import 'package:frontend/repositories/in_app_purchase_repository.dart';

class ProVersionProvider extends ChangeNotifier {
  //The key of a product should be the same as an entitlement name attached to it
  static const _proVersionKey = 'chessknock_pro_version';

  bool _isProStatus = false;
  bool _isPurchaseError = false;
  bool _isRestoreError = false;

  final InAppPurchaseRepository _repository;

  ProVersionProvider({required InAppPurchaseRepository repository})
      : _repository = repository {
    _init();
  }

  void _init() async {
    final isPro = await _repository.checkStatus(_proVersionKey);
    _setProStatus(isPro);
  }

  void _setProStatus(bool status) {
    if (_isProStatus == status) return;
    _isProStatus = status;
    notifyListeners();
  }

  void _setPurchaseError(bool isError) {
    if (_isPurchaseError == isError) return;
    _isPurchaseError = isError;
    notifyListeners();
  }

  void _setRestoreError(bool isRestoreError) {
    if (_isRestoreError == isRestoreError) return;
    _isRestoreError = isRestoreError;
    notifyListeners();
  }

  Future<void> upgradeToPro() async {
    try {
      await _repository.buyProduct(_proVersionKey);
      final isPro = await _repository.checkStatus(_proVersionKey);
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

  Future<void> restorePurchases() async {
    final isRestoreCompleted = await _repository.restorePurchases();
    if (isRestoreCompleted) {
      _setRestoreError(false);
    } else {
      _setRestoreError(true);
      await Future.delayed(const Duration(milliseconds: 100));
      _setRestoreError(false);
    }
  }

  bool get isPro => _isProStatus;
  bool get isPurchaseError => _isPurchaseError;
  bool get isRestoreError => _isRestoreError;
}
