import 'package:flutter/material.dart';

class ProVersionProvider extends ChangeNotifier {
  bool _isProStatus = false;

  void _setProStatus(bool status) {
    _isProStatus = status;
    notifyListeners();
  }

  void upgradeToPro() {
    _setProStatus(true);
  }

  void downgradeFromPro() {
    _setProStatus(false);
  }

  bool get isPro => _isProStatus;
}
