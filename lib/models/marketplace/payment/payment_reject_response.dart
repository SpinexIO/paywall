/// PaymentRejectResponse model
/// Represents the response body of payment reject API call.
class PaymentRejectResponse {
  final List<PaymentRejectResult> success;
  final List<PaymentRejectFail> fail;

  PaymentRejectResponse({required this.success, required this.fail});

  factory PaymentRejectResponse.fromJson(Map<String, dynamic> json) {
    return PaymentRejectResponse(
      success: (json['Success'] as List<dynamic>).map((e) => PaymentRejectResult.fromJson(e)).toList(),
      fail: (json['Fail'] as List<dynamic>).map((e) => PaymentRejectFail.fromJson(e)).toList(),
    );
  }
}

/// Represents successfully rejected products within a payment.
class PaymentRejectResult {
  final int productId;

  PaymentRejectResult({required this.productId});

  factory PaymentRejectResult.fromJson(Map<String, dynamic> json) {
    return PaymentRejectResult(productId: json['ProductId']);
  }
}

/// Represents failed rejections with reasons.
class PaymentRejectFail {
  final int productId;
  final String reason;

  PaymentRejectFail({required this.productId, required this.reason});

  factory PaymentRejectFail.fromJson(Map<String, dynamic> json) {
    return PaymentRejectFail(productId: json['ProductId'], reason: json['Reason']);
  }
}
