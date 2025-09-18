/// Model representing the response of an async pair request.
class PairAsyncRequestResponse {
  final String pairAsyncRequestId;
  final String pairCode;

  PairAsyncRequestResponse({required this.pairAsyncRequestId, required this.pairCode});

  /// Creates an instance from a JSON map.
  factory PairAsyncRequestResponse.fromJson(Map<String, dynamic> json) {
    return PairAsyncRequestResponse(pairAsyncRequestId: json['PairAsyncRequestId'] as String, pairCode: json['PairCode'] as String);
  }

  /// Converts the model into a JSON map.
  Map<String, dynamic> toJson() {
    return {'PairAsyncRequestId': pairAsyncRequestId, 'PairCode': pairCode};
  }
}
