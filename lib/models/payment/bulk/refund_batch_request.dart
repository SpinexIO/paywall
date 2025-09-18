/// Single payment refund item inside a batch
class RefundBatchPayment {
  final String merchantUniqueCode;
  final DateTime date;

  RefundBatchPayment({required this.merchantUniqueCode, required this.date});

  Map<String, dynamic> toJson() {
    return {
      "MerchantUniqueCode": merchantUniqueCode,
      "Date": date.toIso8601String().split('T').first, // yyyy-MM-dd
    };
  }
}

/// Request model for batch refund
class RefundBatchRequest {
  final List<RefundBatchPayment> payments;
  final String callbackUrl;

  RefundBatchRequest({required this.payments, required this.callbackUrl});

  Map<String, dynamic> toJson() {
    return {"Payments": payments.map((e) => e.toJson()).toList(), "CallbackUrl": callbackUrl};
  }
}
