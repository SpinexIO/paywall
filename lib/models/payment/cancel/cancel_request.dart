/// CancelRequest model
/// Represents the request payload for cancelling a payment.
class CancelRequest {
  /// The unique code of the payment transaction on merchant side.
  final String merchantUniqueCode;

  /// The date of the transaction (yyyy-MM-dd format).
  final String date;

  /// Marketplace specific parameter to delete existing records if needed.
  final CancelMarketplace? marketplace;

  CancelRequest({required this.merchantUniqueCode, required this.date, this.marketplace});

  Map<String, dynamic> toJson() => {'MerchantUniqueCode': merchantUniqueCode, 'Date': date, if (marketplace != null) 'MarketPlace': marketplace!.toJson()};
}

/// Marketplace specific cancel request options
class CancelMarketplace {
  /// If true, existing marketplace earnings will be deleted after successful cancel.
  final bool deleteExistingRecords;

  CancelMarketplace({required this.deleteExistingRecords});

  Map<String, dynamic> toJson() => {'DeleteExistingRecords': deleteExistingRecords};
}
