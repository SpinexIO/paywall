/// Single payment inside the bulk query result
class BulkPaymentQueryPayment {
  final String merchantUniqueCode;
  final int paymentId;
  final double amount;
  final int status;
  final int scope;
  final String? trackingCode;
  final int? paymentGatewayId;
  final String? paymentGatewayName;
  final int? paymentGatewayProviderId;
  final String? paymentGatewayProviderKey;
  final String? paywallErrorCode;
  final String? providerErrorCode;
  final String? providerErrorMessage;
  final String? bankErrorCode;
  final String? bankErrorMessage;

  BulkPaymentQueryPayment({
    required this.merchantUniqueCode,
    required this.paymentId,
    required this.amount,
    required this.status,
    required this.scope,
    this.trackingCode,
    this.paymentGatewayId,
    this.paymentGatewayName,
    this.paymentGatewayProviderId,
    this.paymentGatewayProviderKey,
    this.paywallErrorCode,
    this.providerErrorCode,
    this.providerErrorMessage,
    this.bankErrorCode,
    this.bankErrorMessage,
  });

  factory BulkPaymentQueryPayment.fromJson(Map<String, dynamic> json) {
    return BulkPaymentQueryPayment(
      merchantUniqueCode: json['MerchantUniqueCode'],
      paymentId: json['PaymentId'],
      amount: (json['Amount'] as num).toDouble(),
      status: json['Status'],
      scope: json['Scope'],
      trackingCode: json['TrackingCode'],
      paymentGatewayId: json['PaymentGatewayId'],
      paymentGatewayName: json['PaymentGatewayName'],
      paymentGatewayProviderId: json['PaymentGatewayProviderId'],
      paymentGatewayProviderKey: json['PaymentGatewayProviderKey'],
      paywallErrorCode: json['PaywallErrorCode'],
      providerErrorCode: json['ProviderErrorCode'],
      providerErrorMessage: json['ProviderErrorMessage'],
      bankErrorCode: json['BankErrorCode'],
      bankErrorMessage: json['BankErrorMessage'],
    );
  }
}

/// Response model for bulk payment query
class BulkPaymentQueryResponse {
  final bool result;
  final int totalPaymentCount;
  final double totalPaymentAmount;
  final int totalSuccessPaymentCount;
  final double totalSuccessPaymentAmount;
  final int totalUnsuccessfulPaymentCount;
  final double totalUnsuccessfulPaymentAmount;
  final int totalUnprocessedPaymentCount;
  final double totalUnprocessedPaymentAmount;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final List<BulkPaymentQueryPayment> payments;

  BulkPaymentQueryResponse({
    required this.result,
    required this.totalPaymentCount,
    required this.totalPaymentAmount,
    required this.totalSuccessPaymentCount,
    required this.totalSuccessPaymentAmount,
    required this.totalUnsuccessfulPaymentCount,
    required this.totalUnsuccessfulPaymentAmount,
    required this.totalUnprocessedPaymentCount,
    required this.totalUnprocessedPaymentAmount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.payments,
  });

  factory BulkPaymentQueryResponse.fromJson(Map<String, dynamic> json) {
    return BulkPaymentQueryResponse(
      result: json['Result'],
      totalPaymentCount: json['TotalPaymentCount'],
      totalPaymentAmount: (json['TotalPaymentAmount'] as num).toDouble(),
      totalSuccessPaymentCount: json['TotalSuccessPaymentCount'],
      totalSuccessPaymentAmount: (json['TotalSuccessPaymentAmount'] as num).toDouble(),
      totalUnsuccessfulPaymentCount: json['TotalUnsuccessfulPaymentCount'],
      totalUnsuccessfulPaymentAmount: (json['TotalUnsuccessfulPaymentAmount'] as num).toDouble(),
      totalUnprocessedPaymentCount: json['TotalUnprocessedPaymentCount'],
      totalUnprocessedPaymentAmount: (json['TotalUnprocessedPaymentAmount'] as num).toDouble(),
      pageNumber: json['PageNumber'],
      pageSize: json['PageSize'],
      totalPages: json['TotalPages'],
      payments: (json['Payments'] as List).map((e) => BulkPaymentQueryPayment.fromJson(e)).toList(),
    );
  }
}
