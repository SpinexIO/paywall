/// Request model for updating the reflection date of a product earning.
class ProductEarningReflectionRequest {
  final int productId;
  final DateTime reflectionDate;
  final bool applyAll;

  ProductEarningReflectionRequest({required this.productId, required this.reflectionDate, required this.applyAll});

  Map<String, dynamic> toJson() {
    return {'ProductId': productId, 'ReflectionDate': reflectionDate.toIso8601String(), 'ApplyAll': applyAll};
  }
}
