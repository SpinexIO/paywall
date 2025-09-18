/// Async Payment Sale Response model
class PaymentAsyncSaleResponse {
  final String paymentRequestId;
  final String paymentRequestActivityId;
  final int paymentRequestActivityTypeId;
  final int paymentStatus;

  PaymentAsyncSaleResponse({
    required this.paymentRequestId,
    required this.paymentRequestActivityId,
    required this.paymentRequestActivityTypeId,
    required this.paymentStatus,
  });

  factory PaymentAsyncSaleResponse.fromJson(Map<String, dynamic> json) {
    return PaymentAsyncSaleResponse(
      paymentRequestId: json['PaymentRequestId'],
      paymentRequestActivityId: json['PaymentRequestActivityId'],
      paymentRequestActivityTypeId: json['PaymentRequestActivityTypeId'],
      paymentStatus: json['PaymentStatus'],
    );
  }
}
