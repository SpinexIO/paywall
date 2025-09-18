/// Async Payment Cancel Response model
class PaymentAsyncCancelResponse {
  final String paymentRequestId;
  final String paymentRequestActivityId;
  final int paymentRequestActivityTypeId;
  final int paymentStatus;

  PaymentAsyncCancelResponse({
    required this.paymentRequestId,
    required this.paymentRequestActivityId,
    required this.paymentRequestActivityTypeId,
    required this.paymentStatus,
  });

  factory PaymentAsyncCancelResponse.fromJson(Map<String, dynamic> json) {
    return PaymentAsyncCancelResponse(
      paymentRequestId: json['paymentRequestId'],
      paymentRequestActivityId: json['paymentRequestActivityId'],
      paymentRequestActivityTypeId: json['paymentRequestActivityTypeId'],
      paymentStatus: json['paymentStatus'],
    );
  }
}
