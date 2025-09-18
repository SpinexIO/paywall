/// Request model for Sync Cancel Rollback
class PaymentSyncCancelRollbackRequest {
  final String paymentRequestId;

  PaymentSyncCancelRollbackRequest({required this.paymentRequestId});

  Map<String, dynamic> toJson() => {'PaymentRequestId': paymentRequestId};

  factory PaymentSyncCancelRollbackRequest.fromJson(Map<String, dynamic> json) {
    return PaymentSyncCancelRollbackRequest(paymentRequestId: json['PaymentRequestId']);
  }
}
