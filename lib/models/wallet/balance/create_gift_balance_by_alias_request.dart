class CreateGiftBalanceByAliasRequest {
  final String alias;
  final double amount;
  final String externalReference;
  final DateTime? expirationDate;
  final String description;

  CreateGiftBalanceByAliasRequest({required this.alias, required this.amount, required this.externalReference, this.expirationDate, required this.description});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Alias": alias,
      "Amount": amount,
      "ExternalReference": externalReference,
      "ExpirationDate": expirationDate != null
          ? "${expirationDate!.year.toString().padLeft(4, '0')}-"
                "${expirationDate!.month.toString().padLeft(2, '0')}-"
                "${expirationDate!.day.toString().padLeft(2, '0')}"
          : null,
      "Description": description,
    };
  }
}
