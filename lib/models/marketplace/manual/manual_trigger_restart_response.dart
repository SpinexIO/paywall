/// Response model for restarting a manual trigger job.
class ManualTriggerRestartResponse {
  final String jobId;
  final DateTime dateFrom;
  final DateTime dateTo;
  final double earning;
  final int count;

  ManualTriggerRestartResponse({required this.jobId, required this.dateFrom, required this.dateTo, required this.earning, required this.count});

  factory ManualTriggerRestartResponse.fromJson(Map<String, dynamic> json) {
    return ManualTriggerRestartResponse(
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
