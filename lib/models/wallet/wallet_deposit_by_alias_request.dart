/// Wallet Deposit By Alias Request model
/// Hint: Represents the payload required to deposit money into a wallet by alias.
class WalletDepositByAliasRequest {
  final double amount;
  final String description;
  final String alias;
  final String externalReference;

  WalletDepositByAliasRequest({required this.amount, required this.description, required this.alias, required this.externalReference});

  /// Converts [WalletDepositByAliasRequest] to JSON
  Map<String, dynamic> toJson() {
    return {"Amount": amount, "Description": description, "Alias": alias, "ExternalReference": externalReference};
  }
}
