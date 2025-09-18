/// Request model for fetching payment activities of a specific payment
class PaymentActivitiesRequest {
  final int pageIndex;
  final int pageSize;
  final String paymentRequestId; // Guid

  PaymentActivitiesRequest({required this.pageIndex, required this.pageSize, required this.paymentRequestId});

  Map<String, dynamic> toJson() => {'pageIndex': pageIndex, 'pageSize': pageSize, 'PaymentRequestId': paymentRequestId};
}
