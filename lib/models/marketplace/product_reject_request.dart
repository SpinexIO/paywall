/// ProductRejectRequest model
/// Represents the request payload for rejecting specific products in a payment.
class ProductRejectRequest {
  /// List of product IDs to be rejected.
  final List<int> productIds;

  ProductRejectRequest({required this.productIds});

  /// Converts the object to JSON for API request.
  Map<String, dynamic> toJson() {
    return {'ProductIds': productIds};
  }
}
