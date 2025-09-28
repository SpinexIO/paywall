class BlockBalanceResponseData {
  final String id;
  final String walletId;
  final double amount;
  final String description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;

  BlockBalanceResponseData({
    required this.id,
    required this.walletId,
    required this.amount,
    required this.description,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });

  factory BlockBalanceResponseData.fromJson(Map<String, dynamic> json) {
    return BlockBalanceResponseData(
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
