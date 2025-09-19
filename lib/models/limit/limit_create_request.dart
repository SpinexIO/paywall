class LimitCreateRequest {
  final String limitType; // Daily, Monthly, Yearly
  final String limitCategory; // Purchase, Transfer, Withdrawal
  final String limitApproach; // Amount, Count
  final double value;
  final String currencyCode;
  final int regionId;

  LimitCreateRequest({
    required this.limitType,
    required this.limitCategory,
    required this.limitApproach,
    required this.value,
    required this.currencyCode,
    required this.regionId,
  });

  Map<String, dynamic> toJson() {
    return {
      "LimitType": limitType,
      "LimitCategory": limitCategory,
      "LimitApproach": limitApproach,
      "Value": value,
      "CurrencyCode": currencyCode,
      "RegionId": regionId,
    };
  }
}
