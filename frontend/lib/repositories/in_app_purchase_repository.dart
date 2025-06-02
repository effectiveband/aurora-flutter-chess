import 'package:flutter/material.dart';
import 'package:frontend/data_sources/in_app_purchase_data_source.dart';

class InAppPurchaseRepository {
  final IInAppPurchaseDataSource _dataSource;
  final ValueNotifier<bool> _proStatusNotifier;

  InAppPurchaseRepository(
      {required IInAppPurchaseDataSource dataSource,
      required ValueNotifier<bool> proStatusNotifier})
      : _dataSource = dataSource,
        _proStatusNotifier = proStatusNotifier {
    _init();
  }

  Future<bool> buyProduct(String productId) {
    return _dataSource.buyProduct(productId);
  }

  Future<bool> checkStatus(String productId) {
    return _dataSource.checkStatus(productId);
  }

  void _init() {
    _dataSource.init(_proStatusNotifier);
  }

  bool getStatus() {
    return _proStatusNotifier.value;
  }
}
