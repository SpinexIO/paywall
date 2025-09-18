/// Request model for Partial Refund API.
class PartialRefundRequest {
  final String date;
  final String merchantUniqueCode;
  final double amount;
  final MarketPlacePartialRefund? marketPlace;

  PartialRefundRequest({required this.date, required this.merchantUniqueCode, required this.amount, this.marketPlace});

  Map<String, dynamic> toJson() {
    return {'Date': date, 'MerchantUniqueCode': merchantUniqueCode, 'Amount': amount, if (marketPlace != null) 'MarketPlace': marketPlace!.toJson()};
  }
}

/// Marketplace-specific partial refund settings.
class MarketPlacePartialRefund {
  final bool providerCommissionUpdate;
  final MarketDecrease? platform;
  final MarketDecrease? member;

  MarketPlacePartialRefund({required this.providerCommissionUpdate, this.platform, this.member});

  Map<String, dynamic> toJson() {
    return {
      'ProviderCommissionUpdate': providerCommissionUpdate,
      if (platform != null) 'Platform': platform!.toJson(),
      if (member != null) 'Member': member!.toJson(),
    };
  }
}

/// Decrease settings for platform or member.
class MarketDecrease {
  final bool decrease;
  final double? decreaseAmount;

  MarketDecrease({required this.decrease, this.decreaseAmount});

  Map<String, dynamic> toJson() {
    return {'Decrease': decrease, 'DecreaseAmount': decreaseAmount};
  }
}
