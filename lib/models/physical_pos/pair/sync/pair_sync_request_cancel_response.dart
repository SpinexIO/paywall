/// Response model for cancelling a sync pair request.
class PairSyncRequestCancelResponse {
  final bool status;

  PairSyncRequestCancelResponse({required this.status});

  factory PairSyncRequestCancelResponse.fromJson(Map<String, dynamic> json) {
    return PairSyncRequestCancelResponse(status: json['Status'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {'Status': status};
  }
}
