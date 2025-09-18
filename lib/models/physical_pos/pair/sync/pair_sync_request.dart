/// Request model for creating a sync pair request.
/// Either [terminalId] or [terminalTagCode] must be provided, not both.
class PairSyncRequest {
  final String? terminalId;
  final String? terminalTagCode;

  PairSyncRequest({this.terminalId, this.terminalTagCode})
    : assert(terminalId != null || terminalTagCode != null, 'Either terminalId or terminalTagCode must be provided.');

  Map<String, dynamic> toJson() {
    return {if (terminalId != null) 'TerminalId': terminalId, if (terminalTagCode != null) 'TerminalTagCode': terminalTagCode};
  }
}
