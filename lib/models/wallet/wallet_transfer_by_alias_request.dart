/// Wallet Transfer By Alias Request model
/// Hint: Represents the payload required to transfer money between wallets by alias.
class WalletTransferByAliasRequest {
  final String sourceAlias;
  final String destinationAlias;
  final double amount;
  final String description;
  final String externalReference;

  WalletTransferByAliasRequest({
    required this.sourceAlias,
    required this.destinationAlias,
    required this.amount,
    required this.description,
    required this.externalReference,
  });

  /// Converts [WalletTransferByAliasRequest] to JSON
  Map<String, dynamic> toJson() {
    return {
      "SourceAlias": sourceAlias,
      "DestinationAlias": destinationAlias,
      "Amount": amount,
      "Description": description,
      "ExternalReference": externalReference,
    };
  }
}
