/// Wallet Withdraw By Alias Request model
/// Hint: Represents the payload required to withdraw money from a wallet by alias.
class WalletWithdrawByAliasRequest {
  final String alias;
  final double amount;
  final String description;
  final String externalReference;

  WalletWithdrawByAliasRequest({required this.alias, required this.amount, required this.description, required this.externalReference});

  /// Converts [WalletWithdrawByAliasRequest] to JSON
  Map<String, dynamic> toJson() {
    return {"Alias": alias, "Amount": amount, "Description": description, "ExternalReference": externalReference};
  }
}
