/// Request model for Payment List API (Private)
class PaymentListRequest {
  final int page;
  final int pageSize;
  final String date; // Format: yyyy-MM-dd

  PaymentListRequest({required this.page, required this.pageSize, required this.date});

  Map<String, dynamic> toJson() {
    return {'page': page, 'pageSize': pageSize, 'date': date};
  }
}
