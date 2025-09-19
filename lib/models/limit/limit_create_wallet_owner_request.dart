class LimitCreateWalletOwnerRequest {
  final String walletOwnerId;
  final String limitType; // Daily, Monthly
  final String limitCategory; // Deposit, Withdrawal, Transfer, Purchase, Total
  final String limitApproach; // Amount, Count
  final double value;
  final String currencyCode; // TRY, USD, EUR
  final int regionId;

  LimitCreateWalletOwnerRequest({
    required this.walletOwnerId,
    required this.limitType,
    required this.limitCategory,
    required this.limitApproach,
    required this.value,
    required this.currencyCode,
    required this.regionId,
  });

  Map<String, dynamic> toJson() {
    return {
      "WalletOwnerId": walletOwnerId,
      "LimitType": limitType,
      "LimitCategory": limitCategory,
      "LimitApproach": limitApproach,
      "Value": value,
      "CurrencyCode": currencyCode,
      "RegionId": regionId,
    };
  }
}
