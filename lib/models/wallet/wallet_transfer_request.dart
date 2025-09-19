/// Wallet Transfer Request model
/// Hint: Represents the payload required to transfer money between wallets.
class WalletTransferRequest {
  final String sourceWalletId;
  final String destinationWalletId;
  final double amount;
  final String description;
  final String externalReference;

  WalletTransferRequest({
    required this.sourceWalletId,
    required this.destinationWalletId,
    required this.amount,
    required this.description,
    required this.externalReference,
  });

  /// Converts [WalletTransferRequest] to JSON
  Map<String, dynamic> toJson() {
    return {
      "SourceWalletId": sourceWalletId,
      "DestinationWalletId": destinationWalletId,
      "Amount": amount,
      "Description": description,
      "ExternalReference": externalReference,
    };
  }
}
