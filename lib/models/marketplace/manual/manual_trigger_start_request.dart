/// Request model for starting a manual trigger payment job.
class ManualTriggerStartRequest {
  final int currencyId;
  final DateTime dateFrom;
  final DateTime dateTo;
  final bool? testMode;
  final bool? skipExistsControl;

  ManualTriggerStartRequest({required this.currencyId, required this.dateFrom, required this.dateTo, this.testMode, this.skipExistsControl});

  Map<String, dynamic> toJson() {
    return {
      'CurrencyId': currencyId,
      'DateFrom': dateFrom.toIso8601String().split('T').first,
      'DateTo': dateTo.toIso8601String().split('T').first,
      if (testMode != null) 'TestMode': testMode,
      if (skipExistsControl != null) 'SkipExistsControl': skipExistsControl,
    };
  }
}
