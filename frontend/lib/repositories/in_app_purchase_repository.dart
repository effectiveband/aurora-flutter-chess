import 'package:flutter/material.dart';
import 'package:frontend/data_sources/in_app_purchase_data_source.dart';

class InAppPurchaseRepository {
  final IInAppPurchaseDataSource dataSource;
  final ValueNotifier<bool> _proStatusNotifier = ValueNotifier<bool>(false);

  InAppPurchaseRepository({required this.dataSource});

  Future<bool> buyProduct(String productId) {
    return dataSource.buyProduct(productId);
  }

  Future<bool> checkStatus(String productId) {
    return dataSource.checkStatus(productId);
  }

  void init() {
    dataSource.init(_proStatusNotifier);
  }

  bool getStatus() {
    return _proStatusNotifier.value;
  }
}
