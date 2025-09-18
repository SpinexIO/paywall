/// SelfPaymentApproveResponse model
/// Represents the response body of self payment-based approval.
class SelfPaymentApproveResponse {
  final List<SelfPaymentApproveResult> success;
  final List<SelfPaymentApproveFail> fail;

  SelfPaymentApproveResponse({required this.success, required this.fail});

  factory SelfPaymentApproveResponse.fromJson(Map<String, dynamic> json) {
    return SelfPaymentApproveResponse(
      success: (json['Success'] as List<dynamic>).map((e) => SelfPaymentApproveResult.fromJson(e)).toList(),
      fail: (json['Fail'] as List<dynamic>).map((e) => SelfPaymentApproveFail.fromJson(e)).toList(),
    );
  }
}

/// Represents successfully approved products.
class SelfPaymentApproveResult {
  final int productId;

  SelfPaymentApproveResult({required this.productId});

  factory SelfPaymentApproveResult.fromJson(Map<String, dynamic> json) {
    return SelfPaymentApproveResult(productId: json['ProductId']);
  }
}

/// Represents failed product approvals with reasons.
class SelfPaymentApproveFail {
  final int productId;
  final String reason;

  SelfPaymentApproveFail({required this.productId, required this.reason});

  factory SelfPaymentApproveFail.fromJson(Map<String, dynamic> json) {
    return SelfPaymentApproveFail(productId: json['ProductId'], reason: json['Reason']);
  }
}
