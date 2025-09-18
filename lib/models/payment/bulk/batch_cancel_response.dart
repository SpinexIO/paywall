/// Response model for batch cancel payment.
class BatchCancelResponse {
  final bool result;
  final List<BatchCancelPaymentResult> paymentResults;

  BatchCancelResponse({required this.result, required this.paymentResults});

  factory BatchCancelResponse.fromJson(Map<String, dynamic> json) {
    return BatchCancelResponse(
      result: json['Result'],
      paymentResults: (json['PaymentResults'] as List<dynamic>).map((p) => BatchCancelPaymentResult.fromJson(p)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {"Result": result, "PaymentResults": paymentResults.map((p) => p.toJson()).toList()};
  }
}

/// Single payment result in batch cancel response.
class BatchCancelPaymentResult {
  final String merchantUniqueCode;
  final int status;
  final String message;
  final int bulkPaymentId;
  final String? errorMessage;
  final int bulkPaymentJobId;

  BatchCancelPaymentResult({
    required this.merchantUniqueCode,
    required this.status,
    required this.message,
    required this.bulkPaymentId,
    required this.errorMessage,
    required this.bulkPaymentJobId,
  });

  factory BatchCancelPaymentResult.fromJson(Map<String, dynamic> json) {
    return BatchCancelPaymentResult(
      merchantUniqueCode: json['MerchantUniqueCode'],
      status: json['Status'],
      message: json['Message'],
      bulkPaymentId: json['BulkPaymentId'],
      errorMessage: json['ErrorMessage'],
      bulkPaymentJobId: json['BulkPaymentJobId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "MerchantUniqueCode": merchantUniqueCode,
      "Status": status,
      "Message": message,
      "BulkPaymentId": bulkPaymentId,
      "ErrorMessage": errorMessage,
      "BulkPaymentJobId": bulkPaymentJobId,
    };
  }
}
