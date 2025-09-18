/// Response model for File 📁 bulk payments.
class FilePaymentResponse {
  final int bulkPaymentId;
  final String merchantUniqueCode;
  final int processedRecords;
  final int totalRecords;
  final bool isEnqueued;
  final String message;

  FilePaymentResponse({
    required this.bulkPaymentId,
    required this.merchantUniqueCode,
    required this.processedRecords,
    required this.totalRecords,
    required this.isEnqueued,
    required this.message,
  });

  factory FilePaymentResponse.fromJson(Map<String, dynamic> json) {
    return FilePaymentResponse(
      bulkPaymentId: json['BulkPaymentId'],
      merchantUniqueCode: json['MerchantUniqueCode'],
      processedRecords: json['ProcessedRecords'],
      totalRecords: json['TotalRecords'],
      isEnqueued: json['IsEnqueued'],
      message: json['Message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BulkPaymentId': bulkPaymentId,
      'MerchantUniqueCode': merchantUniqueCode,
      'ProcessedRecords': processedRecords,
      'TotalRecords': totalRecords,
      'IsEnqueued': isEnqueued,
      'Message': message,
    };
  }
}
