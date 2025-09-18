/// SelfProductApproveResponse model
/// Represents the response body of self product-based approval.
class SelfProductApproveResponse {
  final List<SelfProductApproveResult> success;
  final List<SelfProductApproveFail> fail;

  SelfProductApproveResponse({required this.success, required this.fail});

  factory SelfProductApproveResponse.fromJson(Map<String, dynamic> json) {
    return SelfProductApproveResponse(
      success: (json['Success'] as List<dynamic>).map((e) => SelfProductApproveResult.fromJson(e)).toList(),
      fail: (json['Fail'] as List<dynamic>).map((e) => SelfProductApproveFail.fromJson(e)).toList(),
    );
  }
}

/// Represents successfully approved products.
class SelfProductApproveResult {
  final int productId;

  SelfProductApproveResult({required this.productId});

  factory SelfProductApproveResult.fromJson(Map<String, dynamic> json) {
    return SelfProductApproveResult(productId: json['ProductId']);
  }
}

/// Represents failed product approvals with reasons.
class SelfProductApproveFail {
  final int productId;
  final String reason;

  SelfProductApproveFail({required this.productId, required this.reason});

  factory SelfProductApproveFail.fromJson(Map<String, dynamic> json) {
    return SelfProductApproveFail(productId: json['ProductId'], reason: json['Reason']);
  }
}
