class LimitUsageWalletOwnerListData {
  final List<LimitUsageWalletOwnerItem> items;
  final int pageNumber;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  LimitUsageWalletOwnerListData({
    required this.items,
    required this.pageNumber,
    required this.totalPages,
    required this.totalCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory LimitUsageWalletOwnerListData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json["Items"];
    final List<LimitUsageWalletOwnerItem> parsedItems =
        (itemsJson as List<dynamic>?)?.map((e) => LimitUsageWalletOwnerItem.fromJson(e as Map<String, dynamic>)).toList() ?? [];

    return LimitUsageWalletOwnerListData(
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

class LimitUsageWalletOwnerItem {
  final String id;
  final String walletId;
  final String limitType;
  final String limitCategory;
  final String limitApproach;
  final double usedValue;
  final double limitValue;
  final double remainingValue;
  final DateTime? periodStart;
  final DateTime? periodEnd;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LimitUsageWalletOwnerItem({
    required this.id,
    required this.walletId,
    required this.limitType,
    required this.limitCategory,
    required this.limitApproach,
    required this.usedValue,
    required this.limitValue,
    required this.remainingValue,
    required this.periodStart,
    required this.periodEnd,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LimitUsageWalletOwnerItem.fromJson(Map<String, dynamic> json) {
    return LimitUsageWalletOwnerItem(
      id: json["Id"] as String? ?? "",
      walletId: json["WalletId"] as String? ?? "",
      limitType: json["LimitType"] as String? ?? "",
      limitCategory: json["LimitCategory"] as String? ?? "",
      limitApproach: json["LimitApproach"] as String? ?? "",
      usedValue: (json["UsedValue"] as num?)?.toDouble() ?? 0,
      limitValue: (json["LimitValue"] as num?)?.toDouble() ?? 0,
      remainingValue: (json["RemainingValue"] as num?)?.toDouble() ?? 0,
      periodStart: json["PeriodStart"] != null ? DateTime.parse(json["PeriodStart"]) : null,
      periodEnd: json["PeriodEnd"] != null ? DateTime.parse(json["PeriodEnd"]) : null,
      isActive: (json["IsActive"] as bool?) ?? false,
      createdAt: json["CreatedAt"] != null ? DateTime.parse(json["CreatedAt"]) : null,
      updatedAt: json["UpdatedAt"] != null ? DateTime.parse(json["UpdatedAt"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Id": id,
      "WalletId": walletId,
      "LimitType": limitType,
      "LimitCategory": limitCategory,
      "LimitApproach": limitApproach,
      "UsedValue": usedValue,
      "LimitValue": limitValue,
      "RemainingValue": remainingValue,
      "PeriodStart": periodStart?.toIso8601String(),
      "PeriodEnd": periodEnd?.toIso8601String(),
      "IsActive": isActive,
      "CreatedAt": createdAt?.toIso8601String(),
      "UpdatedAt": updatedAt?.toIso8601String(),
    };
  }
}
