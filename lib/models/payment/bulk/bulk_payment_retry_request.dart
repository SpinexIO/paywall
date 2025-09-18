/// Request model for bulk payment retry
class BulkPaymentRetryRequest {
  final DateTime date;
  final String merchantUniqueCode;

  BulkPaymentRetryRequest({required this.date, required this.merchantUniqueCode});

  Map<String, dynamic> toJson() {
    return {
      'Date': date.toIso8601String().split('T').first, // yyyy-MM-dd format
      'MerchantUniqueCode': merchantUniqueCode,
    };
  }
}
