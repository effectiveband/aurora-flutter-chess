abstract interface class IInAppPurchaseDataSource {
  Future<bool> buyProduct(String productId);
  Future<bool> checkStatus(String productId);
  void init(Function onInit);
}
