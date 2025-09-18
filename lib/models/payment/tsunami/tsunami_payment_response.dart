/// Response model for Tsunami 🌊 bulk payments.
class TsunamiPaymentResponse {
  final int bulkPaymentId;
  final int batchSize;
  final int batchCount;
  final int processedBatchCount;
  final int notProcessedBatchCount;
  final String merchantUniqueCode;

  TsunamiPaymentResponse({
    required this.bulkPaymentId,
    required this.batchSize,
    required this.batchCount,
    required this.processedBatchCount,
    required this.notProcessedBatchCount,
    required this.merchantUniqueCode,
  });

  factory TsunamiPaymentResponse.fromJson(Map<String, dynamic> json) {
    return TsunamiPaymentResponse(
      bulkPaymentId: json['BulkPaymentId'],
      batchSize: json['BatchSize'],
      batchCount: json['BatchCount'],
      processedBatchCount: json['ProcessedBatchCount'],
      notProcessedBatchCount: json['NotProcessedBatchCount'],
      merchantUniqueCode: json['MerchantUniqueCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BulkPaymentId': bulkPaymentId,
      'BatchSize': batchSize,
      'BatchCount': batchCount,
      'ProcessedBatchCount': processedBatchCount,
      'NotProcessedBatchCount': notProcessedBatchCount,
      'MerchantUniqueCode': merchantUniqueCode,
    };
  }
}
