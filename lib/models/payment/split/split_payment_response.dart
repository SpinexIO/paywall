/// Response model for split payment start
class SplitPaymentResponse {
  final int splitPaymentId;
  final String merchantUniqueCode;
  final int status;
  final List<SplitPaymentResult> payments;

  SplitPaymentResponse({required this.splitPaymentId, required this.merchantUniqueCode, required this.status, required this.payments});

  factory SplitPaymentResponse.fromJson(Map<String, dynamic> json) {
    return SplitPaymentResponse(
      splitPaymentId: json['SplitPaymentId'] ?? 0,
      merchantUniqueCode: json['MerchantUniqueCode'] ?? '',
      status: json['Status'] ?? 0,
      payments: (json['Payments'] as List<dynamic>? ?? []).map((e) => SplitPaymentResult.fromJson(e)).toList(),
    );
  }
}

class SplitPaymentResult {
  final int paymentId;
  final String uniqueCode;
  final String merchantUniqueCode;
  final bool isSuccessful;
  final String statusMessage;
  final String? error;

  SplitPaymentResult({
    required this.paymentId,
    required this.uniqueCode,
    required this.merchantUniqueCode,
    required this.isSuccessful,
    required this.statusMessage,
    this.error,
  });

  factory SplitPaymentResult.fromJson(Map<String, dynamic> json) {
    return SplitPaymentResult(
      paymentId: json['PaymentId'] ?? 0,
      uniqueCode: json['UniqueCode'] ?? '',
      merchantUniqueCode: json['MerchantUniqueCode'] ?? '',
      isSuccessful: json['IsSuccessful'] ?? false,
      statusMessage: json['StatusMessage'] ?? '',
      error: json['Error'],
    );
  }
}
