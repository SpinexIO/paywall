/// Request model for increasing product earning.
class ProductEarningIncreaseRequest {
  final int productId;
  final double earning;
  final bool applyAll;

  ProductEarningIncreaseRequest({required this.productId, required this.earning, required this.applyAll});

  Map<String, dynamic> toJson() {
    return {'ProductId': productId, 'Earning': earning, 'ApplyAll': applyAll};
  }
}
