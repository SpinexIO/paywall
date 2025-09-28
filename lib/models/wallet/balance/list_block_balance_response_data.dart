class BlockBalanceItem {
  final String id;
  final String walletId;
  final double amount;
  final String description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;

  BlockBalanceItem({
    required this.id,
    required this.walletId,
    required this.amount,
    required this.description,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });

  factory BlockBalanceItem.fromJson(Map<String, dynamic> json) {
    return BlockBalanceItem(
      id: json["Id"] as String? ?? "",
      walletId: json["WalletId"] as String? ?? "",
      amount: (json["Amount"] as num?)?.toDouble() ?? 0.0,
      description: json["Description"] as String? ?? "",
      isActive: (json["IsActive"] as bool?) ?? false,
      createdAt: json["CreatedAt"] != null ? DateTime.parse(json["CreatedAt"]) : DateTime.now(),
      updatedAt: json["UpdatedAt"] != null ? DateTime.parse(json["UpdatedAt"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Id": id,
      "WalletId": walletId,
      "Amount": amount,
      "Description": description,
      "IsActive": isActive,
      "CreatedAt": createdAt.toIso8601String(),
      "UpdatedAt": updatedAt?.toIso8601String(),
    };
  }
}

class ListBlockBalanceResponseData {
  final List<BlockBalanceItem> items;
  final int pageNumber;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  ListBlockBalanceResponseData({
    required this.items,
    required this.pageNumber,
    required this.totalPages,
    required this.totalCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory ListBlockBalanceResponseData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json["Items"] as List<dynamic>? ?? [];
    return ListBlockBalanceResponseData(
      items: itemsJson.map((e) => BlockBalanceItem.fromJson(e as Map<String, dynamic>)).toList(),
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
