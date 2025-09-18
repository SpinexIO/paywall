/// Request model for bulk cancel payment.
class BulkCancelRequest {
  final DateTime date;
  final String merchantUniqueCode;

  BulkCancelRequest({required this.date, required this.merchantUniqueCode});

  Map<String, dynamic> toJson() {
    return {
      "Date": date.toIso8601String().split('T').first, // format: yyyy-MM-dd
      "MerchantUniqueCode": merchantUniqueCode,
    };
  }
}
