class GiftBalanceResponseData {
  final String id;
  final String walletId;
  final double amount;
  final double remainingAmount;
  final DateTime? expirationDate;
  final bool isUnlimited;
  final String description;
  final String? lastTransactionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GiftBalanceResponseData({
    required this.id,
    required this.walletId,
    required this.amount,
    required this.remainingAmount,
    required this.expirationDate,
    required this.isUnlimited,
    required this.description,
    required this.lastTransactionId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GiftBalanceResponseData.fromJson(Map<String, dynamic> json) {
    return GiftBalanceResponseData(
      id: json["Id"] as String? ?? "",
      walletId: json["WalletId"] as String? ?? "",
      amount: (json["Amount"] as num?)?.toDouble() ?? 0,
      remainingAmount: (json["RemainingAmount"] as num?)?.toDouble() ?? 0,
      expirationDate: json["ExpirationDate"] != null ? DateTime.parse(json["ExpirationDate"]) : null,
      isUnlimited: (json["IsUnlimited"] as bool?) ?? false,
      description: json["Description"] as String? ?? "",
      lastTransactionId: json["LastTransactionId"] as String?,
      createdAt: json["CreatedAt"] != null ? DateTime.parse(json["CreatedAt"]) : null,
      updatedAt: json["UpdatedAt"] != null ? DateTime.parse(json["UpdatedAt"]) : null,
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
      "LastTransactionId": lastTransactionId,
      "CreatedAt": createdAt?.toIso8601String(),
      "UpdatedAt": updatedAt?.toIso8601String(),
    };
  }
}
