/// Request model for cancelling a provision (provizyon iptal).
class ProvisionCancelRequest {
  final String merchantUniqueCode;
  final DateTime date;

  ProvisionCancelRequest({required this.merchantUniqueCode, required this.date});

  Map<String, dynamic> toJson() {
    return {
      "MerchantUniqueCode": merchantUniqueCode,
      "Date": date.toIso8601String().split('T').first, // YYYY-MM-DD
    };
  }
}
