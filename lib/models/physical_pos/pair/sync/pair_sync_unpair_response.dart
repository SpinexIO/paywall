/// Response model for sync pair unpair operation.
class PairSyncUnpairResponse {
  final String terminalPairId;

  PairSyncUnpairResponse({required this.terminalPairId});

  factory PairSyncUnpairResponse.fromJson(Map<String, dynamic> json) {
    return PairSyncUnpairResponse(terminalPairId: json['TerminalPairId'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'TerminalPairId': terminalPairId};
  }
}
