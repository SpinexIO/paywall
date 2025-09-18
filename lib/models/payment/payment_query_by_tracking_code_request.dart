/// PaymentQueryByTrackingCodeRequest model
/// Represents the request for payment inquiry by TrackingCode.
class PaymentQueryByTrackingCodeRequest {
  /// The tracking code assigned by the merchant.
  final String trackingCode;

  /// Optional merchant unique code for filtering.
  final String? merchantUniqueCode;

  PaymentQueryByTrackingCodeRequest({required this.trackingCode, this.merchantUniqueCode});

  /// Converts the request into headers required by the API.
  Map<String, dynamic> toHeaders() {
    final headers = {'trackingcode': trackingCode};
    if (merchantUniqueCode != null) {
      headers['merchantuniquecode'] = merchantUniqueCode!;
    }
    return headers;
  }
}
