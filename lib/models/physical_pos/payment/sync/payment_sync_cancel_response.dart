/// Response model for Sync Cancel
class PaymentSyncCancelResponse {
  final String paymentRequestId;
  final String paymentRequestActivityId;
  final int paymentRequestActivityTypeId;
  final int paymentStatus;
  final bool failed;
  final String? message;
  final String? clientMessage;
  final bool succeeded;

  PaymentSyncCancelResponse({
    required this.paymentRequestId,
    required this.paymentRequestActivityId,
    required this.paymentRequestActivityTypeId,
    required this.paymentStatus,
    required this.failed,
    this.message,
    this.clientMessage,
    required this.succeeded,
  });

  factory PaymentSyncCancelResponse.fromJson(Map<String, dynamic> json) {
    final result = json['result'] ?? json['Result'];
    return PaymentSyncCancelResponse(
      paymentRequestId: result['paymentRequestId'] ?? result['PaymentRequestId'],
      paymentRequestActivityId: result['paymentRequestActivityId'] ?? result['PaymentRequestActivityId'],
      paymentRequestActivityTypeId: result['paymentRequestActivityTypeId'] ?? result['PaymentRequestActivityTypeId'],
      paymentStatus: result['paymentStatus'] ?? result['PaymentStatus'],
      failed: json['failed'] ?? json['Failed'] ?? false,
      message: json['message'] ?? json['Message'],
      clientMessage: json['clientMessage'] ?? json['ClientMessage'],
      succeeded: json['succeeded'] ?? json['Succeeded'] ?? false,
    );
  }
}
