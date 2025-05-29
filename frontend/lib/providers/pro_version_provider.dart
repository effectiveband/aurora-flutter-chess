import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/repositories/in_app_purchase_repository.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

const _proVersionKey = 'chessknock_pro_version';

class ProVersionProvider extends ChangeNotifier {
  bool _isProStatus = false;

  final InAppPurchaseRepository _repository;

  ProVersionProvider({required InAppPurchaseRepository repository})
      : _repository = repository {
    _init();
  }

  void _init() async {
    if (Platform.isIOS) {
      Purchases.addCustomerInfoUpdateListener((info) {
        info.entitlements.active.containsKey(_proVersionKey)
            ? _setProStatus(true)
            : _setProStatus(false);
      });
      _setProStatus(await _repository.checkStatus(_proVersionKey));
    }
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
