/// Response model for async pair request cancellation.
class PairAsyncRequestCancelResponse {
  final String pairRequestId;

  PairAsyncRequestCancelResponse({required this.pairRequestId});

  factory PairAsyncRequestCancelResponse.fromJson(Map<String, dynamic> json) {
    return PairAsyncRequestCancelResponse(pairRequestId: json['PairRequestId'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'PairRequestId': pairRequestId};
  }
}
