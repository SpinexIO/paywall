/// Async Payment Cancel Request model
class PaymentAsyncCancelRequest {
  final String paymentRequestId;

  PaymentAsyncCancelRequest({required this.paymentRequestId});

  Map<String, dynamic> toJson() => {'PaymentRequestId': paymentRequestId};
}
