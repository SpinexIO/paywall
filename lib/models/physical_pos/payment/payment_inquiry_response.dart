/// Model for the payment inquiry response
class PaymentInquiryResponse {
  final PaymentInquiryResult result;
  final bool failed;
  final String? message;
  final String? clientMessage;
  final bool succeeded;

  PaymentInquiryResponse({required this.result, required this.failed, this.message, this.clientMessage, required this.succeeded});

  factory PaymentInquiryResponse.fromJson(Map<String, dynamic> json) {
    return PaymentInquiryResponse(
      result: PaymentInquiryResult.fromJson(json['Result']),
      failed: json['Failed'] ?? false,
      message: json['Message'],
      clientMessage: json['ClientMessage'],
      succeeded: json['Succeeded'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {'Result': result.toJson(), 'Failed': failed, 'Message': message, 'ClientMessage': clientMessage, 'Succeeded': succeeded};
}

/// Detailed inquiry result model
class PaymentInquiryResult {
  final String paymentRequestId;
  final String paymentRequestActivityId;
  final String terminalId;
  final String merchantUniqueCode;
  final String displayCode;
  final String callbackAddress;
  final double amount;
  final int paymentChannelId;
  final String paymentChannel;
  final int currencyId;
  final String currency;
  final String ip;
  final int paymentTypeId;
  final String paymentType;
  final int paymentStatusId;
  final String paymentStatus;
  final DateTime createdDate;
  final DateTime? modifiedDate;

  PaymentInquiryResult({
    required this.paymentRequestId,
    required this.paymentRequestActivityId,
    required this.terminalId,
    required this.merchantUniqueCode,
    required this.displayCode,
    required this.callbackAddress,
    required this.amount,
    required this.paymentChannelId,
    required this.paymentChannel,
    required this.currencyId,
    required this.currency,
    required this.ip,
    required this.paymentTypeId,
    required this.paymentType,
    required this.paymentStatusId,
    required this.paymentStatus,
    required this.createdDate,
    this.modifiedDate,
  });

  factory PaymentInquiryResult.fromJson(Map<String, dynamic> json) {
    return PaymentInquiryResult(
      paymentRequestId: json['PaymentRequestId'],
      paymentRequestActivityId: json['PaymentRequestActivityId'],
      terminalId: json['TerminalId'],
      merchantUniqueCode: json['MerchantUniqueCode'],
      displayCode: json['DisplayCode'],
      callbackAddress: json['CallbackAddress'],
      amount: (json['Amount'] as num).toDouble(),
      paymentChannelId: json['PaymentChannelId'],
      paymentChannel: json['PaymentChannel'],
      currencyId: json['CurrencyId'],
      currency: json['Currency'],
      ip: json['IP'],
      paymentTypeId: json['PaymentTypeId'],
      paymentType: json['PaymentType'],
      paymentStatusId: json['PaymentStatusId'],
      paymentStatus: json['PaymentStatus'],
      createdDate: DateTime.parse(json['CreatedDate']),
      modifiedDate: json['ModifiedDate'] != null ? DateTime.tryParse(json['ModifiedDate']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'PaymentRequestId': paymentRequestId,
    'PaymentRequestActivityId': paymentRequestActivityId,
    'TerminalId': terminalId,
    'MerchantUniqueCode': merchantUniqueCode,
    'DisplayCode': displayCode,
    'CallbackAddress': callbackAddress,
    'Amount': amount,
    'PaymentChannelId': paymentChannelId,
    'PaymentChannel': paymentChannel,
    'CurrencyId': currencyId,
    'Currency': currency,
    'IP': ip,
    'PaymentTypeId': paymentTypeId,
    'PaymentType': paymentType,
    'PaymentStatusId': paymentStatusId,
    'PaymentStatus': paymentStatus,
    'CreatedDate': createdDate.toIso8601String(),
    'ModifiedDate': modifiedDate?.toIso8601String(),
  };
}
