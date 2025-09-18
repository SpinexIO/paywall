/// Request model for fetching payment list
class PaymentListRequest {
  final int pageIndex;
  final int pageSize;
  final String? startDate; // Format: yyyy-MM-dd
  final String? endDate; // Format: yyyy-MM-dd

  PaymentListRequest({required this.pageIndex, required this.pageSize, this.startDate, this.endDate});

  Map<String, dynamic> toJson() => {
    'pageIndex': pageIndex,
    'pageSize': pageSize,
    if (startDate != null) 'startDate': startDate,
    if (endDate != null) 'endDate': endDate,
  };
}
