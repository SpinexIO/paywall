/// Response model for product-member earning increase.
class ProductMemberEarningIncreaseResponse {
  final int? id; // Body null döndüğü için şimdilik opsiyonel
  final double? earning;

  ProductMemberEarningIncreaseResponse({this.id, this.earning});

  factory ProductMemberEarningIncreaseResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ProductMemberEarningIncreaseResponse();
    return ProductMemberEarningIncreaseResponse(id: json['Id'], earning: (json['Earning'] as num?)?.toDouble());
  }
}
