class GiftBalanceByWalletListData {
  final List<GiftBalanceByWalletItem> items;

  GiftBalanceByWalletListData({required this.items});

  factory GiftBalanceByWalletListData.fromJson(dynamic json) {
    if (json is List) {
      final parsedItems = json.map((e) => GiftBalanceByWalletItem.fromJson(e as Map<String, dynamic>)).toList();
      return GiftBalanceByWalletListData(items: parsedItems);
    } else if (json is Map<String, dynamic> && json["Items"] != null) {
      final parsedItems = (json["Items"] as List<dynamic>).map((e) => GiftBalanceByWalletItem.fromJson(e as Map<String, dynamic>)).toList();
      return GiftBalanceByWalletListData(items: parsedItems);
    } else {
      return GiftBalanceByWalletListData(items: []);
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"Items": items.map((e) => e.toJson()).toList()};
  }
}

class GiftBalanceByWalletItem {
  final String id;
  final String walletId;
  final double amount;
  final double remainingAmount;
  final DateTime? expirationDate;
  final bool isUnlimited;
  final String description;
  final bool isUsed;
  final bool isFullyUsed;
  final bool isPartiallyUsed;
  final String? lastTransactionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GiftBalanceByWalletItem({
    required this.id,
    required this.walletId,
    required this.amount,
    required this.remainingAmount,
    required this.expirationDate,
    required this.isUnlimited,
    required this.description,
    required this.isUsed,
    required this.isFullyUsed,
    required this.isPartiallyUsed,
    required this.lastTransactionId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GiftBalanceByWalletItem.fromJson(Map<String, dynamic> json) {
    return GiftBalanceByWalletItem(
      id: json["Id"] as String? ?? "",
      walletId: json["WalletId"] as String? ?? "",
      amount: (json["Amount"] as num?)?.toDouble() ?? 0,
      remainingAmount: (json["RemainingAmount"] as num?)?.toDouble() ?? 0,
      expirationDate: json["ExpirationDate"] != null ? DateTime.tryParse(json["ExpirationDate"]) : null,
      isUnlimited: (json["IsUnlimited"] as bool?) ?? false,
      description: json["Description"] as String? ?? "",
      isUsed: (json["IsUsed"] as bool?) ?? false,
      isFullyUsed: (json["IsFullyUsed"] as bool?) ?? false,
      isPartiallyUsed: (json["IsPartiallyUsed"] as bool?) ?? false,
      lastTransactionId: json["LastTransactionId"] as String?,
      createdAt: json["CreatedAt"] != null ? DateTime.tryParse(json["CreatedAt"]) : null,
      updatedAt: json["UpdatedAt"] != null ? DateTime.tryParse(json["UpdatedAt"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Id": id,
      "WalletId": walletId,
      "Amount": amount,
      "RemainingAmount": remainingAmount,
      "ExpirationDate": expirationDate?.toIso8601String(),
      "IsUnlimited": isUnlimited,
      "Description": description,
      "IsUsed": isUsed,
      "IsFullyUsed": isFullyUsed,
      "IsPartiallyUsed": isPartiallyUsed,
      "LastTransactionId": lastTransactionId,
      "CreatedAt": createdAt?.toIso8601String(),
      "UpdatedAt": updatedAt?.toIso8601String(),
    };
  }
}
