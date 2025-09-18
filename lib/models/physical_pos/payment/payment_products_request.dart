/// Request model for fetching products of a specific payment
class PaymentProductsRequest {
  final int pageIndex;
  final int pageSize;
  final String paymentRequestId; // Guid

  PaymentProductsRequest({required this.pageIndex, required this.pageSize, required this.paymentRequestId});

  Map<String, dynamic> toJson() => {'pageIndex': pageIndex, 'pageSize': pageSize, 'PaymentRequestId': paymentRequestId};
}
