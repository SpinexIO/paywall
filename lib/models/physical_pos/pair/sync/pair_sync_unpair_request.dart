/// Request model for sync pair unpair operation.
/// [terminalTagCode] must be provided.
class PairSyncUnpairRequest {
  final String terminalTagCode;

  PairSyncUnpairRequest({required this.terminalTagCode});

  Map<String, dynamic> toJson() {
    return {'TerminalTagCode': terminalTagCode};
  }
}
