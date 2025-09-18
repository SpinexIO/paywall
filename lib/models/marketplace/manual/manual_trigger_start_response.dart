/// Response model for starting a manual trigger payment job.
class ManualTriggerStartResponse {
  final String jobId;
  final DateTime dateFrom;
  final DateTime dateTo;
  final double earning;
  final int count;

  ManualTriggerStartResponse({required this.jobId, required this.dateFrom, required this.dateTo, required this.earning, required this.count});

  factory ManualTriggerStartResponse.fromJson(Map<String, dynamic> json) {
    return ManualTriggerStartResponse(
      jobId: json['JobId'] as String,
      dateFrom: DateTime.parse(json['DateFrom']),
      dateTo: DateTime.parse(json['DateTo']),
      earning: (json['Earning'] as num).toDouble(),
      count: json['Count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'JobId': jobId, 'DateFrom': dateFrom.toIso8601String(), 'DateTo': dateTo.toIso8601String(), 'Earning': earning, 'Count': count};
  }
}
