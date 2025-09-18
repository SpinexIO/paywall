/// Response model for starting a direct (non-secure) payment.
class PaymentStartResponse {
  final int errorCode;
  final bool result;
  final String message;
  final PaymentBody? body;

  PaymentStartResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory PaymentStartResponse.fromJson(Map<String, dynamic> json) {
    return PaymentStartResponse(
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'] ?? '',
      body: json['Body'] != null ? PaymentBody.fromJson(json['Body']) : null,
    );
  }
}

/// Body containing payment result details.
class PaymentBody {
  final PaymentInfo payment;
  final PaymentError error;

  PaymentBody({required this.payment, required this.error});

  factory PaymentBody.fromJson(Map<String, dynamic> json) {
    return PaymentBody(payment: PaymentInfo.fromJson(json['Payment']), error: PaymentError.fromJson(json['Error']));
  }
}

class PaymentInfo {
  final int paymentId;
  final int activityId;
  final String uniqueCode;
  final String merchantUniqueKey;
  final int paymentGatewayId;
  final String paymentGatewayName;
  final String paymentGatewayProviderName;
  final PaymentCard card;

  PaymentInfo({
    required this.paymentId,
    required this.activityId,
    required this.uniqueCode,
    required this.merchantUniqueKey,
    required this.paymentGatewayId,
    required this.paymentGatewayName,
    required this.paymentGatewayProviderName,
    required this.card,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) {
    return PaymentInfo(
      paymentId: json['PaymentId'],
      activityId: json['ActivityId'],
      uniqueCode: json['UniqueCode'],
      merchantUniqueKey: json['MerchantUniqueKey'],
      paymentGatewayId: json['PaymentGatewayId'],
      paymentGatewayName: json['PaymentGatewayName'],
      paymentGatewayProviderName: json['PaymentGatewayProviderName'],
      card: PaymentCard.fromJson(json['Card']),
    );
  }
}

class PaymentCard {
  final bool saved;
  final String uniqueCode;

  PaymentCard({required this.saved, required this.uniqueCode});

  factory PaymentCard.fromJson(Map<String, dynamic> json) {
    return PaymentCard(saved: json['Saved'], uniqueCode: json['UniqueCode']);
  }
}

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
