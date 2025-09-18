/// Request model for Sync Sale Rollback
class PaymentSyncSaleRollbackRequest {
  final String paymentRequestId;

  PaymentSyncSaleRollbackRequest({required this.paymentRequestId});

  Map<String, dynamic> toJson() => {'PaymentRequestId': paymentRequestId};

  factory PaymentSyncSaleRollbackRequest.fromJson(Map<String, dynamic> json) {
    return PaymentSyncSaleRollbackRequest(paymentRequestId: json['PaymentRequestId']);
  }
}
