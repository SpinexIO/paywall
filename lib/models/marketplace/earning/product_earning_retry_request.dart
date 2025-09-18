/// Request model for retrying a product earning transaction.
class ProductEarningRetryRequest {
  final int productId;
  final bool changeReflectionDate;
  final DateTime? reflectionDate;
  final bool applyAll;

  ProductEarningRetryRequest({required this.productId, required this.changeReflectionDate, this.reflectionDate, required this.applyAll});

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'ChangeReflectionDate': changeReflectionDate,
      if (reflectionDate != null) 'ReflectionDate': reflectionDate!.toIso8601String(),
      'ApplyAll': applyAll,
    };
  }
}
