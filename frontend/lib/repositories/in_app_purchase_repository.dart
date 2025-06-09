import 'package:frontend/data_sources/in_app_purchase_data_source.dart';

class InAppPurchaseRepository {
  final IInAppPurchaseDataSource _dataSource;

  InAppPurchaseRepository({
    required IInAppPurchaseDataSource dataSource,
  }) : _dataSource = dataSource;

  Future<bool> buyProduct(String productId) {
    return _dataSource.buyProduct(productId);
  }

  Future<bool> checkStatus(String productId) {
    return _dataSource.checkStatus(productId);
  }

  Future<void> restorePurchases() async {
    _dataSource.restorePurchases();
  }
}
