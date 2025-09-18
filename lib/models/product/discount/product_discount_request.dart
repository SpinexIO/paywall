/// Request model for defining a discount for a product.
class ProductDiscountRequest {
  final int productId;
  final int discountOwnerType;
  final int discountType;
  final double discountValue;

  ProductDiscountRequest({required this.productId, required this.discountOwnerType, required this.discountType, required this.discountValue});

  /// Converts the request object to JSON.
  Map<String, dynamic> toJson() {
    return {'ProductId': productId, 'DiscountOwnerType': discountOwnerType, 'DiscountType': discountType, 'DiscountValue': discountValue};
  }
}
