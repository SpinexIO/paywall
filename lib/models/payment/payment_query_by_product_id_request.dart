/// PaymentQueryByProductIdRequest model
/// Represents the request for payment inquiry by ProductId.
class PaymentQueryByProductIdRequest {
  /// The ProductId assigned to the payment by the merchant.
  final String productId;

  /// Optional merchant unique code for filtering.
  final String? merchantUniqueCode;

  PaymentQueryByProductIdRequest({required this.productId, this.merchantUniqueCode});

  /// Converts the request into headers required by the API.
  Map<String, dynamic> toHeaders() {
    final headers = {'productid': productId};
    if (merchantUniqueCode != null) {
      headers['merchantuniquecode'] = merchantUniqueCode!;
    }
    return headers;
  }
}
