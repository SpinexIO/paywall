/// Request model for decreasing product earning.
class ProductEarningDecreaseRequest {
  final int productId;
  final double earning;
  final bool applyAll;

  ProductEarningDecreaseRequest({required this.productId, required this.earning, required this.applyAll});

  Map<String, dynamic> toJson() {
    return {'ProductId': productId, 'Earning': earning, 'ApplyAll': applyAll};
  }
}
