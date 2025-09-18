/// Response model for deleting a bank account method.
/// Contains standard API response fields.
class BankAccountDeleteResponse {
  final int errorCode;
  final bool result;
  final String message;

  BankAccountDeleteResponse({required this.errorCode, required this.result, required this.message});

  factory BankAccountDeleteResponse.fromJson(Map<String, dynamic> json) {
    return BankAccountDeleteResponse(errorCode: json['ErrorCode'], result: json['Result'], message: json['Message'] ?? '');
  }
}
