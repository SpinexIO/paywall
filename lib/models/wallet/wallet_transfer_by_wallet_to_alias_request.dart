/// Wallet Transfer By Wallet To Alias Request model
/// Hint: Represents the payload required to transfer money
/// from a wallet (by ID) to another wallet (by alias).
class WalletTransferByWalletToAliasRequest {
  final String sourceWalletId;
  final String destinationAlias;
  final double amount;
  final String description;
  final String externalReference;

  WalletTransferByWalletToAliasRequest({
    required this.sourceWalletId,
    required this.destinationAlias,
    required this.amount,
    required this.description,
    required this.externalReference,
  });

  /// Converts [WalletTransferByWalletToAliasRequest] to JSON
  Map<String, dynamic> toJson() {
    return {
      "SourceWalletId": sourceWalletId,
      "DestinationAlias": destinationAlias,
      "Amount": amount,
      "Description": description,
      "ExternalReference": externalReference,
    };
  }
}
