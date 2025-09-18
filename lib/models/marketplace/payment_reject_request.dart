/// PaymentRejectRequest model
/// Represents the request payload for rejecting a payment in the marketplace.
class PaymentRejectRequest {
  /// Paywall's payment ID to be rejected.
  final int paymentId;

  PaymentRejectRequest({required this.paymentId});

  /// Converts the object to JSON for API request.
  Map<String, dynamic> toJson() {
    return {'PaymentId': paymentId};
  }
}
