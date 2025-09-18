/// Response model for bulk payment retry
class BulkPaymentRetryResponse {
  final bool result;
  final int bulkPaymentId;
  final int totalPaymentCount;

  BulkPaymentRetryResponse({required this.result, required this.bulkPaymentId, required this.totalPaymentCount});

  factory BulkPaymentRetryResponse.fromJson(Map<String, dynamic> json) {
    return BulkPaymentRetryResponse(result: json['Result'], bulkPaymentId: json['BulkPaymentId'], totalPaymentCount: json['TotalPaymentCount']);
  }
}
