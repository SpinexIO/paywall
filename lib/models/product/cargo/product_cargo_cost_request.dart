/// Request model for fetching cargo cost of a product.
/// Converts `productId` into a request header.
class ProductCargoCostRequest {
  final int productId;

  ProductCargoCostRequest({required this.productId});

  /// Converts request parameters to header format.
  Map<String, String> toHeaders() {
    return {'productid': productId.toString()};
  }
}
