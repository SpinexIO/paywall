/// Response model for provision closing.
class ProvisionResponse {
  final int errorCode;
  final bool result;
  final String message;
  final dynamic body;

  ProvisionResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory ProvisionResponse.fromJson(Map<String, dynamic> json) {
    return ProvisionResponse(errorCode: json['ErrorCode'], result: json['Result'], message: json['Message'] ?? '', body: json['Body']);
  }
}
