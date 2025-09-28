class CommissionByWalletOwnerListData {
  final List<CommissionByWalletOwnerItem> items;
  final int pageNumber;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  CommissionByWalletOwnerListData({
    required this.items,
    required this.pageNumber,
    required this.totalPages,
    required this.totalCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory CommissionByWalletOwnerListData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json["Items"];
    final parsedItems = (itemsJson as List<dynamic>?)?.map((e) => CommissionByWalletOwnerItem.fromJson(e as Map<String, dynamic>)).toList() ?? [];

    return CommissionByWalletOwnerListData(
      items: parsedItems,
      pageNumber: (json["PageNumber"] as num?)?.toInt() ?? 0,
      totalPages: (json["TotalPages"] as num?)?.toInt() ?? 0,
      totalCount: (json["TotalCount"] as num?)?.toInt() ?? 0,
      hasPreviousPage: (json["HasPreviousPage"] as bool?) ?? false,
      hasNextPage: (json["HasNextPage"] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Items": items.map((e) => e.toJson()).toList(),
      "PageNumber": pageNumber,
      "TotalPages": totalPages,
      "TotalCount": totalCount,
      "HasPreviousPage": hasPreviousPage,
      "HasNextPage": hasNextPage,
    };
  }
}

class CommissionByWalletOwnerItem {
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

  CommissionByWalletOwnerItem({
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

  factory CommissionByWalletOwnerItem.fromJson(Map<String, dynamic> json) {
    return CommissionByWalletOwnerItem(
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
