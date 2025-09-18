/// Request model for cancelling a sync pair request.
class PairSyncRequestCancelRequest {
  final String pairRequestId;

  PairSyncRequestCancelRequest({required this.pairRequestId});

  Map<String, dynamic> toJson() {
    return {'PairRequestId': pairRequestId};
  }
}
