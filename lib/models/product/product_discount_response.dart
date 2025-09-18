/// Response model for retrieving product discount information.
class ProductDiscountResponse {
  final int id;
  final int discountOwnerType;
  final int discountType;
  final double discountValue;

  ProductDiscountResponse({required this.id, required this.discountOwnerType, required this.discountType, required this.discountValue});

  /// Creates an instance from JSON.
  factory ProductDiscountResponse.fromJson(Map<String, dynamic> json) {
    return ProductDiscountResponse(
      id: json['Id'] as int,
      discountOwnerType: json['DiscountOwnerType'] as int,
      discountType: json['DiscountType'] as int,
      discountValue: (json['DiscountValue'] as num).toDouble(),
    );
  }
}
