class CommissionResponseData {
  final String id;
  final String level;
  final String transactionType;
  final String feeType;
  final double feeValue;
  final String conditionType;
  final double conditionThreshold;
  final String currencyCode;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? merchantId;

  CommissionResponseData({
    required this.id,
    required this.level,
    required this.transactionType,
    required this.feeType,
    required this.feeValue,
    required this.conditionType,
    required this.conditionThreshold,
    required this.currencyCode,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.merchantId,
  });

  factory CommissionResponseData.fromJson(Map<String, dynamic> json) {
    return CommissionResponseData(
      id: json["Id"] as String? ?? "",
      level: json["Level"] as String? ?? "",
      transactionType: json["TransactionType"] as String? ?? "",
      feeType: json["FeeType"] as String? ?? "",
      feeValue: (json["FeeValue"] as num?)?.toDouble() ?? 0,
      conditionType: json["ConditionType"] as String? ?? "",
      conditionThreshold: (json["ConditionThreshold"] as num?)?.toDouble() ?? 0,
      currencyCode: json["CurrencyCode"] as String? ?? "",
      isActive: (json["IsActive"] as bool?) ?? false,
      createdAt: json["CreatedAt"] != null ? DateTime.tryParse(json["CreatedAt"]) : null,
      updatedAt: json["UpdatedAt"] != null ? DateTime.tryParse(json["UpdatedAt"]) : null,
      merchantId: json["MerchantId"]?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Id": id,
      "Level": level,
      "TransactionType": transactionType,
      "FeeType": feeType,
      "FeeValue": feeValue,
      "ConditionType": conditionType,
      "ConditionThreshold": conditionThreshold,
      "CurrencyCode": currencyCode,
      "IsActive": isActive,
      "CreatedAt": createdAt?.toIso8601String(),
      "UpdatedAt": updatedAt?.toIso8601String(),
      "MerchantId": merchantId,
    };
  }
}
