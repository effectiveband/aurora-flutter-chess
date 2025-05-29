import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/repositories/in_app_purchase_repository.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class ProVersionProvider extends ChangeNotifier {
  bool _isProStatus = false;

  final InAppPurchaseRepository repository;

  ProVersionProvider({required this.repository}) {
    _init();
  }

  void _init() async {
    if (Platform.isIOS) {
      Purchases.addCustomerInfoUpdateListener((info) {
        info.entitlements.active.containsKey('chessknock_pro_version')
            ? _setProStatus(true)
            : _setProStatus(false);
      });
      _setProStatus(await repository.checkStatus('chessknock_pro_version'));
    }
  }

  void _setProStatus(bool status) {
    _isProStatus = status;
    notifyListeners();
  }

  void upgradeToPro() async {
    _setProStatus(await repository.buyProduct('chessknock_pro_version'));
  }

  void downgradeFromPro() {
    _setProStatus(false);
  }

  bool get isPro => _isProStatus;
}
