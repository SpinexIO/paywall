/// Request model for closing a provision (provizyon kapatma).
class ProvisionRequest {
  final String merchantUniqueCode;
  final DateTime date;
  final double? provisionAmount;

  ProvisionRequest({required this.merchantUniqueCode, required this.date, this.provisionAmount});

  Map<String, dynamic> toJson() {
    return {
      "MerchantUniqueCode": merchantUniqueCode,
      "Date": date.toIso8601String().split('T').first, // YYYY-MM-DD format
      if (provisionAmount != null && provisionAmount != 0) "ProvisionAmount": provisionAmount,
    };
  }
}
