/// Response model for adding a new bank account method.
/// Contains only standard API response fields.
class BankAccountAddResponse {
  final int errorCode;
  final bool result;
  final String message;

  BankAccountAddResponse({required this.errorCode, required this.result, required this.message});

  factory BankAccountAddResponse.fromJson(Map<String, dynamic> json) {
    return BankAccountAddResponse(errorCode: json['ErrorCode'], result: json['Result'], message: json['Message'] ?? '');
  }
}
