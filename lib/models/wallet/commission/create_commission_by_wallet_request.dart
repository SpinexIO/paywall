class CreateCommissionByWalletRequest {
  final String walletId;
  final String transactionType;
  final String feeType;
  final double feeValue;
  final int conditionType;
  final double conditionThreshold;

  CreateCommissionByWalletRequest({
    required this.walletId,
    required this.transactionType,
    required this.feeType,
    required this.feeValue,
    required this.conditionType,
    required this.conditionThreshold,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "WalletId": walletId,
      "TransactionType": transactionType,
      "FeeType": feeType,
      "FeeValue": feeValue,
      "ConditionType": conditionType,
      "ConditionThreshold": conditionThreshold,
    };
  }
}
