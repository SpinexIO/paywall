/// Sync Payment Sale Response model
class PaymentSyncSaleResponse {
  final String paymentRequestId;
  final String paymentRequestActivityId;
  final int paymentRequestActivityTypeId;
  final int paymentStatus;

  PaymentSyncSaleResponse({
    required this.paymentRequestId,
    required this.paymentRequestActivityId,
    required this.paymentRequestActivityTypeId,
    required this.paymentStatus,
  });

  factory PaymentSyncSaleResponse.fromJson(Map<String, dynamic> json) {
    return PaymentSyncSaleResponse(
      paymentRequestId: json['PaymentRequestId'],
      paymentRequestActivityId: json['PaymentRequestActivityId'],
      paymentRequestActivityTypeId: json['PaymentRequestActivityTypeId'],
      paymentStatus: json['PaymentStatus'],
    );
  }
}
