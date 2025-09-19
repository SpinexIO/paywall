/// Wallet Transfer Response Data
/// Hint: Represents the result of a transfer transaction between two wallets.
class WalletTransferResponseData {
  final String transferId;
  final String sourceTransactionId;
  final String destinationTransactionId;
  final String sourceWalletId;
  final String destinationWalletId;
  final double sourceWalletBalanceAfterTransaction;
  final double destinationWalletBalanceAfterTransaction;

  WalletTransferResponseData({
    required this.transferId,
    required this.sourceTransactionId,
    required this.destinationTransactionId,
    required this.sourceWalletId,
    required this.destinationWalletId,
    required this.sourceWalletBalanceAfterTransaction,
    required this.destinationWalletBalanceAfterTransaction,
  });

  /// Creates [WalletTransferResponseData] from JSON
  factory WalletTransferResponseData.fromJson(Map<String, dynamic> json) {
    return WalletTransferResponseData(
      transferId: json['TransferId'] ?? '',
      sourceTransactionId: json['SourceTransactionId'] ?? '',
      destinationTransactionId: json['DestinationTransactionId'] ?? '',
      sourceWalletId: json['SourceWalletId'] ?? '',
      destinationWalletId: json['DestinationWalletId'] ?? '',
      sourceWalletBalanceAfterTransaction: (json['SourceWalletBalanceAfterTransaction'] as num?)?.toDouble() ?? 0.0,
      destinationWalletBalanceAfterTransaction: (json['DestinationWalletBalanceAfterTransaction'] as num?)?.toDouble() ?? 0.0,
    );
  }

  /// Converts [WalletTransferResponseData] to JSON
  Map<String, dynamic> toJson() {
    return {
      "TransferId": transferId,
      "SourceTransactionId": sourceTransactionId,
      "DestinationTransactionId": destinationTransactionId,
      "SourceWalletId": sourceWalletId,
      "DestinationWalletId": destinationWalletId,
      "SourceWalletBalanceAfterTransaction": sourceWalletBalanceAfterTransaction,
      "DestinationWalletBalanceAfterTransaction": destinationWalletBalanceAfterTransaction,
    };
  }
}
