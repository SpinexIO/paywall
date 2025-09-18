/// Response model for payment API version check.
class VersionResponse {
  final int errorCode;
  final bool result;
  final String message;
  final String body;

  VersionResponse({required this.errorCode, required this.result, required this.message, required this.body});

  factory VersionResponse.fromJson(Map<String, dynamic> json) {
    return VersionResponse(errorCode: json['ErrorCode'], result: json['Result'], message: json['Message'] ?? '', body: json['Body'] ?? '');
  }
}
