/// PaymentApproveResponse model
/// Represents the response body of payment-based approval.
class PaymentApproveResponse {
  final List<PaymentApproveResult> success;
  final List<PaymentApproveFail> fail;

  PaymentApproveResponse({required this.success, required this.fail});

  factory PaymentApproveResponse.fromJson(Map<String, dynamic> json) {
    return PaymentApproveResponse(
      success: (json['Success'] as List<dynamic>).map((e) => PaymentApproveResult.fromJson(e)).toList(),
      fail: (json['Fail'] as List<dynamic>).map((e) => PaymentApproveFail.fromJson(e)).toList(),
    );
  }
}

/// Represents successfully approved products in a payment.
class PaymentApproveResult {
  final int productId;

  PaymentApproveResult({required this.productId});

  factory PaymentApproveResult.fromJson(Map<String, dynamic> json) {
    return PaymentApproveResult(productId: json['ProductId']);
  }
}

/// Represents failed product approvals with reasons.
class PaymentApproveFail {
  final int productId;
  final String reason;

  PaymentApproveFail({required this.productId, required this.reason});

  factory PaymentApproveFail.fromJson(Map<String, dynamic> json) {
    return PaymentApproveFail(productId: json['ProductId'], reason: json['Reason']);
  }
}
