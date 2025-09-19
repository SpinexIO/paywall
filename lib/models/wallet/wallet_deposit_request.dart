/// Wallet Deposit Request model
/// Hint: Represents the payload required to deposit money into a wallet.
class WalletDepositRequest {
  final String id;
  final double amount;
  final String description;
  final String externalReference;

  WalletDepositRequest({required this.id, required this.amount, required this.description, required this.externalReference});

  /// Converts [WalletDepositRequest] to JSON
  Map<String, dynamic> toJson() {
    return {"Id": id, "Amount": amount, "Description": description, "ExternalReference": externalReference};
  }
}
