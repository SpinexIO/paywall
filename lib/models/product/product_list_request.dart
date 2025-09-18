/// Request model for fetching the product list of a payment.
class ProductListRequest {
  final int paymentId;

  ProductListRequest({required this.paymentId});

  Map<String, dynamic> toHeaders() {
    return {'paymentid': paymentId.toString()};
  }
}
