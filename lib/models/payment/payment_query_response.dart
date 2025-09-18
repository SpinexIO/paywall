/// PaymentQueryResponse model
/// Represents the response body of the payment inquiry API.
class PaymentQueryResponse {
  final int paymentId;
  final String uniqueCode;
  final String merchantUniqueCode;
  final String? trackingCode;
  final int activityId;
  final bool status;
  final String statusName;

  // Additional details (provider, card info, amounts, etc.)
  final int? paymentGatewayId;
  final String? paymentGatewayName;
  final String? paymentGatewayProviderName;

  final String? cardNumber;
  final String? cardOwnerName;
  final String? cardBankName;
  final String? cardBrandName;
  final String? cardTypeName;
  final String? cardFamilyName;

  final double? paymentAmount;
  final double? activityAmount;
  final double? originalAmount;
  final double? commissionAmount;
  final double? interestAmount;

  final DateTime? lastActivityDateTime;

  PaymentQueryResponse({
    required this.paymentId,
    required this.uniqueCode,
    required this.merchantUniqueCode,
    required this.activityId,
    required this.status,
    required this.statusName,
    this.trackingCode,
    this.paymentGatewayId,
    this.paymentGatewayName,
    this.paymentGatewayProviderName,
    this.cardNumber,
    this.cardOwnerName,
    this.cardBankName,
    this.cardBrandName,
    this.cardTypeName,
    this.cardFamilyName,
    this.paymentAmount,
    this.activityAmount,
    this.originalAmount,
    this.commissionAmount,
    this.interestAmount,
    this.lastActivityDateTime,
  });

  factory PaymentQueryResponse.fromJson(Map<String, dynamic> json) {
    final paywall = json['Paywall'] ?? {};

    return PaymentQueryResponse(
      paymentId: paywall['PaymentId'],
      uniqueCode: paywall['UniqueCode'],
      merchantUniqueCode: paywall['MerchantUniqueCode'],
      trackingCode: paywall['TrackingCode'],
      activityId: paywall['ActivityId'],
      status: paywall['Status'] ?? false,
      statusName: paywall['StatusName'] ?? '',
      paymentGatewayId: paywall['PaymentGatewayId'],
      paymentGatewayName: paywall['PaymentGatewayName'],
      paymentGatewayProviderName: paywall['PaymentGatewayProviderName'],
      cardNumber: paywall['CardNumber'],
      cardOwnerName: paywall['CardOwnerName'],
      cardBankName: paywall['CardBankName'],
      cardBrandName: paywall['CardBrandName'],
      cardTypeName: paywall['CardTypeName'],
      cardFamilyName: paywall['CardFamilyName'],
      paymentAmount: (paywall['PaymentAmount'] as num?)?.toDouble(),
      activityAmount: (paywall['ActivityAmount'] as num?)?.toDouble(),
      originalAmount: (paywall['OriginalAmount'] as num?)?.toDouble(),
      commissionAmount: (paywall['CommissionAmount'] as num?)?.toDouble(),
      interestAmount: (paywall['InterestAmount'] as num?)?.toDouble(),
      lastActivityDateTime: paywall['LastActivityDateTime'] != null ? DateTime.tryParse(paywall['LastActivityDateTime']) : null,
    );
  }
}
