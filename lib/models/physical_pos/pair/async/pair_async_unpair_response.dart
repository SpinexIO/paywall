/// Response model for async pair unpair operation.
class PairAsyncUnpairResponse {
  final String terminalPairId;

  PairAsyncUnpairResponse({required this.terminalPairId});

  factory PairAsyncUnpairResponse.fromJson(Map<String, dynamic> json) {
    return PairAsyncUnpairResponse(terminalPairId: json['TerminalPairId'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'TerminalPairId': terminalPairId};
  }
}
