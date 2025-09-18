/// Response model for member delete API.
/// Contains standard API response fields.
class MemberDeleteResponse {
  final int errorCode;
  final bool result;
  final String message;

  MemberDeleteResponse({required this.errorCode, required this.result, required this.message});

  factory MemberDeleteResponse.fromJson(Map<String, dynamic> json) {
    return MemberDeleteResponse(errorCode: json['ErrorCode'], result: json['Result'], message: json['Message'] ?? '');
  }
}
