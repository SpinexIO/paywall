/// Response model for product-based earning report.
class ProductEarningResponse {
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

  ProductEarningResponse({
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

  factory ProductEarningResponse.fromJson(Map<String, dynamic> json) {
    return ProductEarningResponse(
      paymentId: json['PaymentId'] as int,
      productId: json['ProductId'] as int,
      productExternalId: json['ProductExternalId'] as String,
      productName: json['ProductName'] as String,
      productAmount: (json['ProductAmount'] as num).toDouble(),
      merchantEarningId: json['MerchantEarningId'] as int,
      merchantEarning: (json['MerchantEarning'] as num).toDouble(),
      merchantReflectionDate: DateTime.parse(json['MerchantReflectionDate']),
      subMerchantEarningId: json['SubMerchantEarningId'] as int,
      subMerchantEarning: (json['SubMerchantEarning'] as num).toDouble(),
      subMerchantReflectionDate: DateTime.parse(json['SubMerchantReflectionDate']),
      merchantEarningStatusId: json['MerchantEarningStatusId'] as int,
      merchantPayoutTransactionId: json['MerchantPayoutTransactionId'] as int,
      subMerchantEarningStatusId: json['SubMerchantEarningStatusId'] as int,
      subMerchantPayoutTransactionId: json['SubMerchantPayoutTransactionId'] as int,
    );
  }
}
