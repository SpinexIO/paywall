/// Response model for bulk (Storm 🍃) payments.
class StormPaymentResponse {
  final int bulkPaymentId;
  final String merchantUniqueCode;
  final List<StormPaymentResult> payments;

  StormPaymentResponse({required this.bulkPaymentId, required this.merchantUniqueCode, required this.payments});

  factory StormPaymentResponse.fromJson(Map<String, dynamic> json) {
    return StormPaymentResponse(
      bulkPaymentId: json['BulkPaymentId'],
      merchantUniqueCode: json['MerchantUniqueCode'],
      payments: (json['Payments'] as List).map((e) => StormPaymentResult.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'BulkPaymentId': bulkPaymentId, 'MerchantUniqueCode': merchantUniqueCode, 'Payments': payments.map((e) => e.toJson()).toList()};
  }
}

class StormPaymentResult {
  final int paymentId;
  final String uniqueCode;
  final String merchantUniqueCode;

  StormPaymentResult({required this.paymentId, required this.uniqueCode, required this.merchantUniqueCode});

  factory StormPaymentResult.fromJson(Map<String, dynamic> json) {
    return StormPaymentResult(paymentId: json['PaymentId'], uniqueCode: json['UniqueCode'], merchantUniqueCode: json['MerchantUniqueCode']);
  }

  Map<String, dynamic> toJson() {
    return {'PaymentId': paymentId, 'UniqueCode': uniqueCode, 'MerchantUniqueCode': merchantUniqueCode};
  }
}
