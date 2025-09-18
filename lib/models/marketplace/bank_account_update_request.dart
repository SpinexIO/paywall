/// Request model for updating an existing bank account method.
class BankAccountUpdateRequest {
  final int id; // Bank account Id in Paywall
  final int currencyId;
  final String title;
  final String iban;

  BankAccountUpdateRequest({required this.id, required this.currencyId, required this.title, required this.iban});

  Map<String, dynamic> toJson() {
    return {"Id": id, "CurrencyId": currencyId, "Title": title, "Iban": iban};
  }
}
