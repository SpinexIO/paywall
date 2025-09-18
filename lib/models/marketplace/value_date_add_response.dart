/// Response model for adding or updating value date (valör) and commission settings.
/// Contains only standard API response fields.
class ValueDateAddResponse {
  final int errorCode;
  final bool result;
  final String message;

  ValueDateAddResponse({required this.errorCode, required this.result, required this.message});

  factory ValueDateAddResponse.fromJson(Map<String, dynamic> json) {
    return ValueDateAddResponse(errorCode: json['ErrorCode'], result: json['Result'], message: json['Message'] ?? '');
  }
}
