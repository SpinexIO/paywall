/// Response model for updating a bank account method.
/// Contains standard API response fields.
class BankAccountUpdateResponse {
  final int errorCode;
  final bool result;
  final String message;

  BankAccountUpdateResponse({required this.errorCode, required this.result, required this.message});

  factory BankAccountUpdateResponse.fromJson(Map<String, dynamic> json) {
    return BankAccountUpdateResponse(errorCode: json['ErrorCode'], result: json['Result'], message: json['Message'] ?? '');
  }
}
