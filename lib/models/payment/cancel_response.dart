/// CancelResponse model
/// Represents the response returned by the cancel payment API.
class CancelResponse {
  /// Error code of the operation. `0` means success.
  final int errorCode;

  /// Result of the operation. `true` if successful, otherwise `false`.
  final bool result;

  /// Message related to the operation (error or success info).
  final String message;

  /// Optional body, mostly null for cancel requests.
  final dynamic body;

  CancelResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory CancelResponse.fromJson(Map<String, dynamic> json) {
    return CancelResponse(errorCode: json['ErrorCode'] ?? 0, result: json['Result'] ?? false, message: json['Message'] ?? '', body: json['Body']);
  }
}
