import 'package:flutter/material.dart';
import 'package:frontend/repositories/in_app_purchase_repository.dart';

class ProVersionProvider extends ChangeNotifier {
  //The key of a product should be the same as an entitlement name attached to it
  static const _proVersionKey = 'chessknock_pro_version';

  bool _isProStatus = false;

  final InAppPurchaseRepository _repository;

  ProVersionProvider({required InAppPurchaseRepository repository})
      : _repository = repository {
    _init();
  }

  void _init() async {
    _repository.init(_setProStatus);
  }

  void _setProStatus(bool status) {
    _isProStatus = status;
    notifyListeners();
  }

  void upgradeToPro() async {
    _setProStatus(await _repository.buyProduct(_proVersionKey));
  }

  void downgradeFromPro() {
    _setProStatus(false);
  }

  bool get isPro => _isProStatus;
}
