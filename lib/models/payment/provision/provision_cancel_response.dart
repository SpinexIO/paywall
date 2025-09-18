/// Response model for provision cancel.
class ProvisionCancelResponse {
  final int errorCode;
  final bool result;
  final String message;
  final dynamic body;

  ProvisionCancelResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory ProvisionCancelResponse.fromJson(Map<String, dynamic> json) {
    return ProvisionCancelResponse(errorCode: json['ErrorCode'], result: json['Result'], message: json['Message'] ?? '', body: json['Body']);
  }
}
