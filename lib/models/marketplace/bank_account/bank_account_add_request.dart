/// Request model for adding a new bank account method to a member.
class BankAccountAddRequest {
  final int memberId;
  final int currencyId;
  final String title;
  final String iban;

  BankAccountAddRequest({required this.memberId, required this.currencyId, required this.title, required this.iban});

  Map<String, dynamic> toJson() {
    return {"MemberId": memberId, "CurrencyId": currencyId, "Title": title, "Iban": iban};
  }
}
