/// Response model for starting a direct (non-secure) insurance payment.
class PaymentStartInsuranceResponse {
  final int errorCode;
  final bool result;
  final String message;
  final PaymentInsuranceBody? body;

  PaymentStartInsuranceResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory PaymentStartInsuranceResponse.fromJson(Map<String, dynamic> json) {
    return PaymentStartInsuranceResponse(
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'] ?? '',
      body: json['Body'] != null ? PaymentInsuranceBody.fromJson(json['Body']) : null,
    );
  }
}

class PaymentInsuranceBody {
  final PaymentInsuranceInfo payment;
  final PaymentError error;

  PaymentInsuranceBody({required this.payment, required this.error});

  factory PaymentInsuranceBody.fromJson(Map<String, dynamic> json) {
    return PaymentInsuranceBody(payment: PaymentInsuranceInfo.fromJson(json['Payment']), error: PaymentError.fromJson(json['Error']));
  }
}

class PaymentInsuranceInfo {
  final int paymentId;
  final int activityId;
  final String uniqueCode;
  final String merchantUniqueKey;
  final int paymentGatewayId;
  final String paymentGatewayName;
  final String paymentGatewayProviderName;

  PaymentInsuranceInfo({
    required this.paymentId,
    required this.activityId,
    required this.uniqueCode,
    required this.merchantUniqueKey,
    required this.paymentGatewayId,
    required this.paymentGatewayName,
    required this.paymentGatewayProviderName,
  });

  factory PaymentInsuranceInfo.fromJson(Map<String, dynamic> json) {
    return PaymentInsuranceInfo(
      paymentId: json['PaymentId'],
      activityId: json['ActivityId'],
      uniqueCode: json['UniqueCode'],
      merchantUniqueKey: json['MerchantUniqueKey'],
      paymentGatewayId: json['PaymentGatewayId'],
      paymentGatewayName: json['PaymentGatewayName'],
      paymentGatewayProviderName: json['PaymentGatewayProviderName'],
    );
  }
}

/// Reuses PaymentError from payment_start_response.dart
class PaymentError {
  final String? providerErrorCode;
  final String? providerErrorMessage;
  final String? bankErrorCode;
  final String? bankErrorMessage;

  PaymentError({this.providerErrorCode, this.providerErrorMessage, this.bankErrorCode, this.bankErrorMessage});

  factory PaymentError.fromJson(Map<String, dynamic> json) {
    return PaymentError(
      providerErrorCode: json['ProviderErrorCode'],
      providerErrorMessage: json['ProviderErrorMessage'],
      bankErrorCode: json['BankErrorCode'],
      bankErrorMessage: json['BankErrorMessage'],
    );
  }
}
