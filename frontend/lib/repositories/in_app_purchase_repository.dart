import 'package:frontend/data_sources/in_app_purchase_data_source.dart';

class InAppPurchaseRepository {
  final IInAppPurchaseDataSource dataSource;

  InAppPurchaseRepository({required this.dataSource});

  Future<bool> buyProduct(String productId) async {
    try {
      return dataSource.buyProduct(productId);
    } catch (_) {
      rethrow;
    }
  }

  Future<bool> checkStatus(String productId) {
    return dataSource.checkStatus(productId);
  }
}
