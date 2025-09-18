/// Response model for sync pair request.
class PairSyncResponse {
  final String pairRequestId;
  final String terminalId;
  final String pairCode;

  PairSyncResponse({required this.pairRequestId, required this.terminalId, required this.pairCode});

  factory PairSyncResponse.fromJson(Map<String, dynamic> json) {
    return PairSyncResponse(pairRequestId: json['PairRequestId'] as String, terminalId: json['TerminalId'] as String, pairCode: json['PairCode'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'PairRequestId': pairRequestId, 'TerminalId': terminalId, 'PairCode': pairCode};
  }
}
