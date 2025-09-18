/// Request model for increasing member earning of a product.
class ProductMemberEarningIncreaseRequest {
  final int paymentId;
  final int productId;
  final double earning;

  ProductMemberEarningIncreaseRequest({required this.paymentId, required this.productId, required this.earning});

  Map<String, dynamic> toJson() => {'PaymentId': paymentId, 'ProductId': productId, 'Earning': earning};
}
