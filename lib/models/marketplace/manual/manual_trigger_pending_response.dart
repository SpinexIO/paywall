/// Response model for retrieving pending manual trigger earnings.
class ManualTriggerPendingResponse {
  final DateTime dateFrom;
  final DateTime dateTo;
  final double earning;
  final int count;

  ManualTriggerPendingResponse({required this.dateFrom, required this.dateTo, required this.earning, required this.count});

  factory ManualTriggerPendingResponse.fromJson(Map<String, dynamic> json) {
    return ManualTriggerPendingResponse(
      dateFrom: DateTime.parse(json['DateFrom']),
      dateTo: DateTime.parse(json['DateTo']),
      earning: (json['Earning'] as num).toDouble(),
      count: json['Count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'DateFrom': dateFrom.toIso8601String(), 'DateTo': dateTo.toIso8601String(), 'Earning': earning, 'Count': count};
  }
}
