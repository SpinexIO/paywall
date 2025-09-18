/// Response model for bulk payment summary query
class BulkPaymentSummaryResponse {
  final bool result;
  final int totalPaymentCount;
  final double totalPaymentAmount;
  final int totalSuccessPaymentCount;
  final double totalSuccessPaymentAmount;
  final int totalUnsuccessfulPaymentCount;
  final double totalUnsuccessfulPaymentAmount;
  final int totalUnprocessedPaymentCount;
  final double totalUnprocessedPaymentAmount;

  BulkPaymentSummaryResponse({
    required this.result,
    required this.totalPaymentCount,
    required this.totalPaymentAmount,
    required this.totalSuccessPaymentCount,
    required this.totalSuccessPaymentAmount,
    required this.totalUnsuccessfulPaymentCount,
    required this.totalUnsuccessfulPaymentAmount,
    required this.totalUnprocessedPaymentCount,
    required this.totalUnprocessedPaymentAmount,
  });

  factory BulkPaymentSummaryResponse.fromJson(Map<String, dynamic> json) {
    return BulkPaymentSummaryResponse(
      result: json['Result'],
      totalPaymentCount: json['TotalPaymentCount'],
      totalPaymentAmount: (json['TotalPaymentAmount'] as num).toDouble(),
      totalSuccessPaymentCount: json['TotalSuccessPaymentCount'],
      totalSuccessPaymentAmount: (json['TotalSuccessPaymentAmount'] as num).toDouble(),
      totalUnsuccessfulPaymentCount: json['TotalUnsuccessfulPaymentCount'],
      totalUnsuccessfulPaymentAmount: (json['TotalUnsuccessfulPaymentAmount'] as num).toDouble(),
      totalUnprocessedPaymentCount: json['TotalUnprocessedPaymentCount'],
      totalUnprocessedPaymentAmount: (json['TotalUnprocessedPaymentAmount'] as num).toDouble(),
    );
  }
}
