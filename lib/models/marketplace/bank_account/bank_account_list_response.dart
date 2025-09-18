/// Response model for listing bank accounts of a member.
/// Contains standard API response fields and a list of bank accounts.
class BankAccountListResponse {
  final int errorCode;
  final bool result;
  final String message;
  final List<BankAccountListItem>? body;

  BankAccountListResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory BankAccountListResponse.fromJson(Map<String, dynamic> json) {
    return BankAccountListResponse(
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'] ?? '',
      body: json['Body'] != null ? (json['Body'] as List<dynamic>).map((e) => BankAccountListItem.fromJson(e)).toList() : null,
    );
  }
}

/// Single bank account item returned in the list.
class BankAccountListItem {
  final int id;
  final int currencyId;
  final String currency;
  final String title;
  final String iban;

  BankAccountListItem({required this.id, required this.currencyId, required this.currency, required this.title, required this.iban});

  factory BankAccountListItem.fromJson(Map<String, dynamic> json) {
    return BankAccountListItem(id: json['Id'], currencyId: json['CurrencyId'], currency: json['Currency'], title: json['Title'], iban: json['Iban']);
  }
}
