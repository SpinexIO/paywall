/// Response model for each refunded payment inside the batch
class RefundBatchPaymentResult {
  final String merchantUniqueCode;
  final int status;
  final String message;
  final int bulkPaymentId;
  final String? errorMessage;
  final int bulkPaymentJobId;

  RefundBatchPaymentResult({
    required this.merchantUniqueCode,
    required this.status,
    required this.message,
    required this.bulkPaymentId,
    this.errorMessage,
    required this.bulkPaymentJobId,
  });

  factory RefundBatchPaymentResult.fromJson(Map<String, dynamic> json) {
    return RefundBatchPaymentResult(
      merchantUniqueCode: json['MerchantUniqueCode'],
      status: json['Status'],
      message: json['Message'],
      bulkPaymentId: json['BulkPaymentId'],
      errorMessage: json['ErrorMessage'],
      bulkPaymentJobId: json['BulkPaymentJobId'],
    );
  }
}

/// Response model for batch refund
class RefundBatchResponse {
  final bool result;
  final List<RefundBatchPaymentResult> paymentResults;

  RefundBatchResponse({required this.result, required this.paymentResults});

  factory RefundBatchResponse.fromJson(Map<String, dynamic> json) {
    return RefundBatchResponse(
      result: json['Result'],
      paymentResults: (json['PaymentResults'] as List).map((e) => RefundBatchPaymentResult.fromJson(e)).toList(),
    );
  }
}
