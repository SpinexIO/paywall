/// Request model for bulk payment callback retry
class BulkPaymentCallbackRequest {
  final DateTime date;
  final String merchantUniqueCode;

  BulkPaymentCallbackRequest({required this.date, required this.merchantUniqueCode});

  Map<String, dynamic> toJson() {
    return {
      'Date': date.toIso8601String().split('T').first, // yyyy-MM-dd format
      'MerchantUniqueCode': merchantUniqueCode,
    };
  }
}
