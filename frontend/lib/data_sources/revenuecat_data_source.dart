import 'package:frontend/data_sources/in_app_purchase_data_source.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatDataSource implements IInAppPurchaseDataSource {
  @override
  Future<bool> buyProduct(String productId) async {
    final product = (await Purchases.getProducts([productId])).first;
    return (await Purchases.purchaseStoreProduct(product))
            .entitlements
            .active[productId] !=
        null;
  }

  @override
  Future<bool> checkStatus(String productId) async {
    final customerInfo = await Purchases.getCustomerInfo();
    return customerInfo.entitlements.active.containsKey(productId);
  }
}
