/// Response model for fetching earnings by payment.
class PaymentEarningResponse {
  final int paymentId;
  final int productId;
  final String productExternalId;
  final String productName;
  final double productAmount;
  final int merchantEarningId;
  final double merchantEarning;
  final DateTime merchantReflectionDate;
  final int subMerchantEarningId;
  final double subMerchantEarning;
  final DateTime subMerchantReflectionDate;
  final int merchantEarningStatusId;
  final int merchantPayoutTransactionId;
  final int subMerchantEarningStatusId;
  final int subMerchantPayoutTransactionId;

  PaymentEarningResponse({
    required this.paymentId,
    required this.productId,
    required this.productExternalId,
    required this.productName,
    required this.productAmount,
    required this.merchantEarningId,
    required this.merchantEarning,
    required this.merchantReflectionDate,
    required this.subMerchantEarningId,
    required this.subMerchantEarning,
    required this.subMerchantReflectionDate,
    required this.merchantEarningStatusId,
    required this.merchantPayoutTransactionId,
    required this.subMerchantEarningStatusId,
    required this.subMerchantPayoutTransactionId,
  });

  factory PaymentEarningResponse.fromJson(Map<String, dynamic> json) {
    return PaymentEarningResponse(
      paymentId: json['PaymentId'],
      productId: json['ProductId'],
      productExternalId: json['ProductExternalId'],
      productName: json['ProductName'],
      productAmount: (json['ProductAmount'] as num).toDouble(),
      merchantEarningId: json['MerchantEarningId'],
      merchantEarning: (json['MerchantEarning'] as num).toDouble(),
      merchantReflectionDate: DateTime.parse(json['MerchantReflectionDate']),
      subMerchantEarningId: json['SubMerchantEarningId'],
      subMerchantEarning: (json['SubMerchantEarning'] as num).toDouble(),
      subMerchantReflectionDate: DateTime.parse(json['SubMerchantReflectionDate']),
      merchantEarningStatusId: json['MerchantEarningStatusId'],
      merchantPayoutTransactionId: json['MerchantPayoutTransactionId'],
      subMerchantEarningStatusId: json['SubMerchantEarningStatusId'],
      subMerchantPayoutTransactionId: json['SubMerchantPayoutTransactionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PaymentId': paymentId,
      'ProductId': productId,
      'ProductExternalId': productExternalId,
      'ProductName': productName,
      'ProductAmount': productAmount,
      'MerchantEarningId': merchantEarningId,
      'MerchantEarning': merchantEarning,
      'MerchantReflectionDate': merchantReflectionDate.toIso8601String(),
      'SubMerchantEarningId': subMerchantEarningId,
      'SubMerchantEarning': subMerchantEarning,
      'SubMerchantReflectionDate': subMerchantReflectionDate.toIso8601String(),
      'MerchantEarningStatusId': merchantEarningStatusId,
      'MerchantPayoutTransactionId': merchantPayoutTransactionId,
      'SubMerchantEarningStatusId': subMerchantEarningStatusId,
      'SubMerchantPayoutTransactionId': subMerchantPayoutTransactionId,
    };
  }
}
