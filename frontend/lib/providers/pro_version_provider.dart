import 'package:flutter/material.dart';

class ProVersionProvider extends ChangeNotifier {
  bool _isProStatus = false;

  void setProStatus(bool status) {
    _isProStatus = status;
    notifyListeners();
  }

  void upgradeToPro() {
    setProStatus(true);
  }

  void downgradeFromPro() {
    setProStatus(false);
  }

  bool get isPro => _isProStatus;
}
