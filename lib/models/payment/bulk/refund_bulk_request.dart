/// Request model for bulk refund payment.
class RefundBulkRequest {
  final DateTime date;
  final String merchantUniqueCode;

  RefundBulkRequest({required this.date, required this.merchantUniqueCode});

  Map<String, dynamic> toJson() {
    return {
      "Date": date.toIso8601String().split('T').first, // yyyy-MM-dd
      "MerchantUniqueCode": merchantUniqueCode,
    };
  }
}
