/// PaymentQueryByPaymentIdRequest model
/// Represents the request for payment inquiry by PaymentId.
class PaymentQueryByPaymentIdRequest {
  /// The Paywall system's unique payment ID.
  final int paymentId;

  PaymentQueryByPaymentIdRequest({required this.paymentId});

  /// Converts the request into headers required by the API.
  Map<String, dynamic> toHeaders() => {'paymentid': paymentId.toString()};
}
