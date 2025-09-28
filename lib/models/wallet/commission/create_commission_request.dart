class CreateCommissionRequest {
  final String transactionType;
  final String feeType;
  final double feeValue;
  final int conditionType;
  final double conditionThreshold;
  final String currencyCode;
  final int regionId;

  CreateCommissionRequest({
    required this.transactionType,
    required this.feeType,
    required this.feeValue,
    required this.conditionType,
    required this.conditionThreshold,
    required this.currencyCode,
    required this.regionId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "TransactionType": transactionType,
      "FeeType": feeType,
      "FeeValue": feeValue,
      "ConditionType": conditionType,
      "ConditionThreshold": conditionThreshold,
      "CurrencyCode": currencyCode,
      "RegionId": regionId,
    };
  }
}
