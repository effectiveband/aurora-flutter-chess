import 'package:flutter/material.dart';

abstract interface class IInAppPurchaseDataSource {
  Future<bool> buyProduct(String productId);
  Future<bool> checkStatus(String productId);
  void init(ValueNotifier<bool> notifier);
}
