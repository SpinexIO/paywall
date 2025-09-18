/// RevertRequest model
/// Represents the request payload for cancel & refund (revert) operation.
class RevertRequest {
  /// The unique code returned by Paywall after payment initialization.
  final String uniqueCode;

  /// The unique merchant code sent during payment initialization.
  final String merchantUniqueCode;

  /// Optional refund amount.
  /// - If 0, the full amount will be refunded.
  /// - If different from the original amount, it will be treated as partial refund.
  final double? amount;

  /// Marketplace-specific parameters.
  final RevertMarketplace? marketplace;

  RevertRequest({required this.uniqueCode, required this.merchantUniqueCode, this.amount, this.marketplace});

  Map<String, dynamic> toJson() => {
    'UniqueCode': uniqueCode,
    'MerchantUniqueCode': merchantUniqueCode,
    if (amount != null) 'Amount': amount,
    if (marketplace != null) 'MarketPlace': marketplace!.toJson(),
  };
}

/// Marketplace specific revert options
class RevertMarketplace {
  /// If true, existing marketplace earnings will be deleted after successful revert.
  final bool deleteExistingRecords;

  RevertMarketplace({required this.deleteExistingRecords});

  Map<String, dynamic> toJson() => {'DeleteExistingRecords': deleteExistingRecords};
}
