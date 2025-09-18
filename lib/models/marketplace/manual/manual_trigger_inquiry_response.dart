/// Response model for manual trigger inquiry.
class ManualTriggerInquiryResponse {
  final String jobId;
  final DateTime dateFrom;
  final DateTime dateTo;
  final double earning;
  final int count;
  final bool anySuccess;
  final List<ManualTriggerInquiryResult> results;

  ManualTriggerInquiryResponse({
    required this.jobId,
    required this.dateFrom,
    required this.dateTo,
    required this.earning,
    required this.count,
    required this.anySuccess,
    required this.results,
  });

  factory ManualTriggerInquiryResponse.fromJson(Map<String, dynamic> json) {
    return ManualTriggerInquiryResponse(
      jobId: json['JobId'] as String,
      dateFrom: DateTime.parse(json['DateFrom']),
      dateTo: DateTime.parse(json['DateTo']),
      earning: (json['Earning'] as num).toDouble(),
      count: json['Count'] as int,
      anySuccess: json['AnySuccess'] as bool,
      results: (json['Results'] as List<dynamic>).map((e) => ManualTriggerInquiryResult.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'JobId': jobId,
      'DateFrom': dateFrom.toIso8601String(),
      'DateTo': dateTo.toIso8601String(),
      'Earning': earning,
      'Count': count,
      'AnySuccess': anySuccess,
      'Results': results.map((e) => e.toJson()).toList(),
    };
  }
}

class ManualTriggerInquiryResult {
  final bool result;
  final String resultMessage;

  ManualTriggerInquiryResult({required this.result, required this.resultMessage});

  factory ManualTriggerInquiryResult.fromJson(Map<String, dynamic> json) {
    return ManualTriggerInquiryResult(result: json['Result'] as bool, resultMessage: json['ResultMessage'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'Result': result, 'ResultMessage': resultMessage};
  }
}
