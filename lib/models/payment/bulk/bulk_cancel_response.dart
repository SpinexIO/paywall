/// Response model for bulk cancel payment.
class BulkCancelResponse {
  final bool result;
  final int bulkPaymentId;
  final int totalPaymentCount;

  BulkCancelResponse({required this.result, required this.bulkPaymentId, required this.totalPaymentCount});

  factory BulkCancelResponse.fromJson(Map<String, dynamic> json) {
    return BulkCancelResponse(result: json['Result'], bulkPaymentId: json['BulkPaymentId'], totalPaymentCount: json['TotalPaymentCount']);
  }

  Map<String, dynamic> toJson() {
    return {"Result": result, "BulkPaymentId": bulkPaymentId, "TotalPaymentCount": totalPaymentCount};
  }
}
