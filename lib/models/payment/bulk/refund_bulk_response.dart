/// Response model for bulk refund payment.
class RefundBulkResponse {
  final bool result;
  final int bulkPaymentId;
  final int totalPaymentCount;

  RefundBulkResponse({required this.result, required this.bulkPaymentId, required this.totalPaymentCount});

  factory RefundBulkResponse.fromJson(Map<String, dynamic> json) {
    return RefundBulkResponse(result: json['Result'], bulkPaymentId: json['BulkPaymentId'], totalPaymentCount: json['TotalPaymentCount']);
  }

  Map<String, dynamic> toJson() {
    return {"Result": result, "BulkPaymentId": bulkPaymentId, "TotalPaymentCount": totalPaymentCount};
  }
}
