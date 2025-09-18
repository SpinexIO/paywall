/// ProductRejectResponse model
/// Represents the response body of product reject API call.
class ProductRejectResponse {
  final List<ProductRejectResult> success;
  final List<ProductRejectFail> fail;

  ProductRejectResponse({required this.success, required this.fail});

  factory ProductRejectResponse.fromJson(Map<String, dynamic> json) {
    return ProductRejectResponse(
      success: (json['Success'] as List<dynamic>).map((e) => ProductRejectResult.fromJson(e)).toList(),
      fail: (json['Fail'] as List<dynamic>).map((e) => ProductRejectFail.fromJson(e)).toList(),
    );
  }
}

/// Represents successfully rejected products.
class ProductRejectResult {
  final int productId;

  ProductRejectResult({required this.productId});

  factory ProductRejectResult.fromJson(Map<String, dynamic> json) {
    return ProductRejectResult(productId: json['ProductId']);
  }
}

/// Represents failed rejections with reasons.
class ProductRejectFail {
  final int productId;
  final String reason;

  ProductRejectFail({required this.productId, required this.reason});

  factory ProductRejectFail.fromJson(Map<String, dynamic> json) {
    return ProductRejectFail(productId: json['ProductId'], reason: json['Reason']);
  }
}
