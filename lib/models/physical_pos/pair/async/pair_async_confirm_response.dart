

/// Response model for async pair confirmation.
class PairAsyncConfirmResponse {
  final String terminalPairId;

  PairAsyncConfirmResponse({required this.terminalPairId});

  factory PairAsyncConfirmResponse.fromJson(Map<String, dynamic> json) {
    return PairAsyncConfirmResponse(terminalPairId: json['TerminalPairId'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'TerminalPairId': terminalPairId};
  }
}
