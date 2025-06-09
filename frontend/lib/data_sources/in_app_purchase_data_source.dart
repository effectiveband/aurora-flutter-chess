abstract interface class IInAppPurchaseDataSource {
  Future<bool> buyProduct(String productId);
  Future<bool> checkStatus(String productId);
  Future<void> restorePurchases();
}
