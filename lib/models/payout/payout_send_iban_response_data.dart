class PayoutSendIbanResponseData {
  final bool result;
  final int payoutTransactionId;
  final String merchantUniqueCode;
  final String uniqueCode;
  final double amount;

  PayoutSendIbanResponseData({
    required this.result,
    required this.payoutTransactionId,
    required this.merchantUniqueCode,
    required this.uniqueCode,
    required this.amount,
  });

  factory PayoutSendIbanResponseData.fromJson(Map<String, dynamic> json) {
    return PayoutSendIbanResponseData(
      result: (json["Result"] as bool?) ?? false,
      payoutTransactionId: (json["PayoutTransactionId"] as num?)?.toInt() ?? 0,
      merchantUniqueCode: json["MerchantUniqueCode"] as String? ?? "",
      uniqueCode: json["UniqueCode"] as String? ?? "",
      amount: (json["Amount"] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Result": result,
      "PayoutTransactionId": payoutTransactionId,
      "MerchantUniqueCode": merchantUniqueCode,
      "UniqueCode": uniqueCode,
      "Amount": amount,
    };
  }
}
