import 'dart:io';

import 'package:frontend/data_sources/in_app_purchase_data_source.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatDataSource implements IInAppPurchaseDataSource {
  //The key of a product should be the same as an entitlement name attached to it
  static const _proVersionKey = 'chessknock_pro_version';
  @override
  Future<bool> buyProduct(String productId) async {
    final product = (await Purchases.getProducts([productId])).first;
    final customerInfo = await Purchases.purchaseStoreProduct(product);
    final isPro = customerInfo.entitlements.active[productId] != null;
    return isPro;
  }

  @override
  Future<bool> checkStatus(String productId) async {
    final customerInfo = await Purchases.getCustomerInfo();
    return customerInfo.entitlements.active.containsKey(productId);
  }

  @override
  void init(Function function) {
    try {
      final callback = function as void Function(bool);
      if (Platform.isIOS) {
        Purchases.addCustomerInfoUpdateListener((info) {
          info.entitlements.active.containsKey(_proVersionKey)
              ? callback(true)
              : callback(false);
        });
      }
    } catch (e) {
      throw Exception('function type should be void Function(bool)');
    }
  }
}
