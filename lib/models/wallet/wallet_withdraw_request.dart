/// Wallet Withdraw Request model
/// Hint: Represents the payload required to withdraw money from a wallet.
class WalletWithdrawRequest {
  final String id;
  final double amount;
  final String description;
  final String externalReference;

  WalletWithdrawRequest({required this.id, required this.amount, required this.description, required this.externalReference});

  /// Converts [WalletWithdrawRequest] to JSON
  Map<String, dynamic> toJson() {
    return {"Id": id, "Amount": amount, "Description": description, "ExternalReference": externalReference};
  }
}
