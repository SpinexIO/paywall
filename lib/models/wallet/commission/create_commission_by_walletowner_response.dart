class CommissionByWalletOwnerResponseData {
  final String id;
  final String level;
  final String walletOwnerId;
  final String? walletId;
  final String? merchantId;
  final String transactionType;
  final String feeType;
  final double feeValue;
  final String conditionType;
  final double conditionThreshold;
  final String currencyCode;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CommissionByWalletOwnerResponseData({
    required this.id,
    required this.level,
    required this.walletOwnerId,
    this.walletId,
    this.merchantId,
    required this.transactionType,
    required this.feeType,
    required this.feeValue,
    required this.conditionType,
    required this.conditionThreshold,
    required this.currencyCode,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommissionByWalletOwnerResponseData.fromJson(Map<String, dynamic> json) {
    return CommissionByWalletOwnerResponseData(
      id: json["Id"] as String? ?? "",
      level: json["Level"] as String? ?? "",
      walletOwnerId: json["WalletOwnerId"] as String? ?? "",
      walletId: json["WalletId"] as String?,
      merchantId: json["MerchantId"]?.toString(),
      transactionType: json["TransactionType"] as String? ?? "",
      feeType: json["FeeType"] as String? ?? "",
      feeValue: (json["FeeValue"] as num?)?.toDouble() ?? 0,
      conditionType: json["ConditionType"] as String? ?? "",
      conditionThreshold: (json["ConditionThreshold"] as num?)?.toDouble() ?? 0,
      currencyCode: json["CurrencyCode"] as String? ?? "",
      isActive: (json["IsActive"] as bool?) ?? false,
      createdAt: json["CreatedAt"] != null ? DateTime.tryParse(json["CreatedAt"]) : null,
      updatedAt: json["UpdatedAt"] != null ? DateTime.tryParse(json["UpdatedAt"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Id": id,
      "Level": level,
      "WalletOwnerId": walletOwnerId,
      "WalletId": walletId,
      "MerchantId": merchantId,
      "TransactionType": transactionType,
      "FeeType": feeType,
      "FeeValue": feeValue,
      "ConditionType": conditionType,
      "ConditionThreshold": conditionThreshold,
      "CurrencyCode": currencyCode,
      "IsActive": isActive,
      "CreatedAt": createdAt?.toIso8601String(),
      "UpdatedAt": updatedAt?.toIso8601String(),
    };
  }
}
