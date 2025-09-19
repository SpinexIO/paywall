/// Wallet Detail Response Data
/// Hint: Represents the wallet data returned by GET /v1/wallet/by/id/{id}.
class WalletDetailResponseData {
  final String id;
  final String walletOwnerId;
  final String name;
  final String alias;
  final int regionId;
  final String currencyCode;
  final double balance;
  final double availableBalance;
  final double totalGiftBalance;
  final double blockedBalance;
  final String frozenUntil;
  final bool isFrozen;
  final bool isDeleted;
  final String createdAt;
  final String? updatedAt;
  final bool allowOverdraft;
  final double overdraftLimit;

  WalletDetailResponseData({
    required this.id,
    required this.walletOwnerId,
    required this.name,
    required this.alias,
    required this.regionId,
    required this.currencyCode,
    required this.balance,
    required this.availableBalance,
    required this.totalGiftBalance,
    required this.blockedBalance,
    required this.frozenUntil,
    required this.isFrozen,
    required this.isDeleted,
    required this.createdAt,
    this.updatedAt,
    required this.allowOverdraft,
    required this.overdraftLimit,
  });

  /// Creates [WalletDetailResponseData] from JSON
  factory WalletDetailResponseData.fromJson(Map<String, dynamic> json) {
    return WalletDetailResponseData(
      id: json['Id'] ?? '',
      walletOwnerId: json['WalletOwnerId'] ?? '',
      name: json['Name'] ?? '',
      alias: json['Alias'] ?? '',
      regionId: json['RegionId'] ?? 0,
      currencyCode: json['CurrencyCode'] ?? '',
      balance: (json['Balance'] as num?)?.toDouble() ?? 0.0,
      availableBalance: (json['AvailableBalance'] as num?)?.toDouble() ?? 0.0,
      totalGiftBalance: (json['TotalGiftBalance'] as num?)?.toDouble() ?? 0.0,
      blockedBalance: (json['BlockedBalance'] as num?)?.toDouble() ?? 0.0,
      frozenUntil: json['FrozenUntil'] ?? '',
      isFrozen: json['IsFrozen'] ?? false,
      isDeleted: json['IsDeleted'] ?? false,
      createdAt: json['CreatedAt'] ?? '',
      updatedAt: json['UpdatedAt'],
      allowOverdraft: json['AllowOverdraft'] ?? false,
      overdraftLimit: (json['OverdraftLimit'] as num?)?.toDouble() ?? 0.0,
    );
  }

  /// Converts [WalletDetailResponseData] to JSON
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "WalletOwnerId": walletOwnerId,
      "Name": name,
      "Alias": alias,
      "RegionId": regionId,
      "CurrencyCode": currencyCode,
      "Balance": balance,
      "AvailableBalance": availableBalance,
      "TotalGiftBalance": totalGiftBalance,
      "BlockedBalance": blockedBalance,
      "FrozenUntil": frozenUntil,
      "IsFrozen": isFrozen,
      "IsDeleted": isDeleted,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "AllowOverdraft": allowOverdraft,
      "OverdraftLimit": overdraftLimit,
    };
  }
}
