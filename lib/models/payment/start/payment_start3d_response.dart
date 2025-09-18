/// Response model for starting a 3D Secure payment.
class PaymentStart3DResponse {
  final int errorCode;
  final bool result;
  final String message;
  final Payment3DBody? body;

  PaymentStart3DResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory PaymentStart3DResponse.fromJson(Map<String, dynamic> json) {
    return PaymentStart3DResponse(
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'] ?? '',
      body: json['Body'] != null ? Payment3DBody.fromJson(json['Body']) : null,
    );
  }
}

class Payment3DBody {
  final String? message;
  final String redirectUrl;
  final Payment3DInfo payment;

  Payment3DBody({this.message, required this.redirectUrl, required this.payment});

  factory Payment3DBody.fromJson(Map<String, dynamic> json) {
    return Payment3DBody(message: json['Message'], redirectUrl: json['RedirectUrl'], payment: Payment3DInfo.fromJson(json['Payment']));
  }
}

class Payment3DInfo {
  final int paymentId;
  final int activityId;
  final String uniqueCode;
  final String merchantUniqueKey;

  Payment3DInfo({required this.paymentId, required this.activityId, required this.uniqueCode, required this.merchantUniqueKey});

  factory Payment3DInfo.fromJson(Map<String, dynamic> json) {
    return Payment3DInfo(
      paymentId: json['PaymentId'],
      activityId: json['ActivityId'],
      uniqueCode: json['UniqueCode'],
      merchantUniqueKey: json['MerchantUniqueKey'],
    );
  }
}
