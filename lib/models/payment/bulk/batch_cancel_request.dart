/// Request model for batch cancel payment.
class BatchCancelRequest {
  final List<BatchCancelPayment> payments;
  final String callbackUrl;

  BatchCancelRequest({required this.payments, required this.callbackUrl});

  Map<String, dynamic> toJson() {
    return {"Payments": payments.map((p) => p.toJson()).toList(), "CallbackUrl": callbackUrl};
  }
}

/// Single payment item in batch cancel request.
class BatchCancelPayment {
  final String merchantUniqueCode;
  final DateTime date;

  BatchCancelPayment({required this.merchantUniqueCode, required this.date});

  Map<String, dynamic> toJson() {
    return {
      "MerchantUniqueCode": merchantUniqueCode,
      "Date": date.toIso8601String().split('T').first, // yyyy-MM-dd format
    };
  }
}
