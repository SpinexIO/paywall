/// Request model for restarting a manual trigger job.
class ManualTriggerRestartRequest {
  final String jobId;

  ManualTriggerRestartRequest({required this.jobId});

  factory ManualTriggerRestartRequest.fromJson(Map<String, dynamic> json) {
    return ManualTriggerRestartRequest(jobId: json['JobId'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'JobId': jobId};
  }
}
