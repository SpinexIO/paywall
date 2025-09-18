/// ProductApproveResponse model
/// Represents the response body of product-based payment approval.
class ProductApproveResponse {
  final List<ProductApproveResult> success;
  final List<ProductApproveFail> fail;

  ProductApproveResponse({required this.success, required this.fail});

  factory ProductApproveResponse.fromJson(Map<String, dynamic> json) {
    return ProductApproveResponse(
      success: (json['Success'] as List<dynamic>).map((e) => ProductApproveResult.fromJson(e)).toList(),
      fail: (json['Fail'] as List<dynamic>).map((e) => ProductApproveFail.fromJson(e)).toList(),
    );
  }
}

/// Represents successfully approved products.
class ProductApproveResult {
  final int productId;

  ProductApproveResult({required this.productId});

  factory ProductApproveResult.fromJson(Map<String, dynamic> json) {
    return ProductApproveResult(productId: json['ProductId']);
  }
}

/// Represents failed product approvals with reasons.
class ProductApproveFail {
  final int productId;
  final String reason;

  ProductApproveFail({required this.productId, required this.reason});

  factory ProductApproveFail.fromJson(Map<String, dynamic> json) {
    return ProductApproveFail(productId: json['ProductId'], reason: json['Reason']);
  }
}
