import 'package:frontend/data_sources/in_app_purchase_data_source.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatDataSource implements IInAppPurchaseDataSource {
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
  Future<bool> restorePurchases() async {
    try {
      await Purchases.restorePurchases();
      return true;
    } catch (_) {
      return false;
    }
  }
}
