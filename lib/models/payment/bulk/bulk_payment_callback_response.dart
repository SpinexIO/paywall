/// Response model for bulk payment callback retry
class BulkPaymentCallbackResponse {
  final String message;
  final int bulkPaymentId;

  BulkPaymentCallbackResponse({required this.message, required this.bulkPaymentId});

  factory BulkPaymentCallbackResponse.fromJson(Map<String, dynamic> json) {
    return BulkPaymentCallbackResponse(message: json['Message'] ?? '', bulkPaymentId: json['BulkPaymentId'] ?? 0);
  }
}
