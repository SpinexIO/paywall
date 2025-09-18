/// Response model for Sync Sale Rollback
class PaymentSyncSaleRollbackResponse {
  final String paymentRequestId;
  final String paymentRequestActivityId;
  final int paymentRequestActivityTypeId;
  final int paymentStatus;
  final bool failed;
  final String? message;
  final String? clientMessage;
  final bool succeeded;

  PaymentSyncSaleRollbackResponse({
    required this.paymentRequestId,
    required this.paymentRequestActivityId,
    required this.paymentRequestActivityTypeId,
    required this.paymentStatus,
    required this.failed,
    this.message,
    this.clientMessage,
    required this.succeeded,
  });

  factory PaymentSyncSaleRollbackResponse.fromJson(Map<String, dynamic> json) {
    final result = json['Result'] as Map<String, dynamic>;
    return PaymentSyncSaleRollbackResponse(
      paymentRequestId: result['PaymentRequestId'],
      paymentRequestActivityId: result['PaymentRequestActivityId'],
      paymentRequestActivityTypeId: result['PaymentRequestActivityTypeId'],
      paymentStatus: result['PaymentStatus'],
      failed: json['Failed'] ?? false,
      message: json['Message'],
      clientMessage: json['ClientMessage'],
      succeeded: json['Succeeded'] ?? false,
    );
  }
}
