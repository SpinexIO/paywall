/// Wallet Balance Response Data
/// Hint: Represents the balance details of a wallet.
class WalletBalanceResponseData {
  final String id;
  final String name;
  final String alias;
  final double walletBalance;
  final List<dynamic> giftBalances; // TODO: define GiftBalance model if structure provided
  final double totalGiftBalance;
  final double blockedBalance;
  final double totalBalance;
  final double availableBalance;

  WalletBalanceResponseData({
    required this.id,
    required this.name,
    required this.alias,
    required this.walletBalance,
    required this.giftBalances,
    required this.totalGiftBalance,
    required this.blockedBalance,
    required this.totalBalance,
    required this.availableBalance,
  });

  /// Creates [WalletBalanceResponseData] from JSON
  factory WalletBalanceResponseData.fromJson(Map<String, dynamic> json) {
    return WalletBalanceResponseData(
      id: json['Id'] ?? '',
      name: json['Name'] ?? '',
      alias: json['Alias'] ?? '',
      walletBalance: (json['WalletBalance'] as num?)?.toDouble() ?? 0.0,
      giftBalances: json['GiftBalances'] ?? [],
      totalGiftBalance: (json['TotalGiftBalance'] as num?)?.toDouble() ?? 0.0,
      blockedBalance: (json['BlockedBalance'] as num?)?.toDouble() ?? 0.0,
      totalBalance: (json['TotalBalance'] as num?)?.toDouble() ?? 0.0,
      availableBalance: (json['AvailableBalance'] as num?)?.toDouble() ?? 0.0,
    );
  }

  /// Converts [WalletBalanceResponseData] to JSON
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Name": name,
      "Alias": alias,
      "WalletBalance": walletBalance,
      "GiftBalances": giftBalances,
      "TotalGiftBalance": totalGiftBalance,
      "BlockedBalance": blockedBalance,
      "TotalBalance": totalBalance,
      "AvailableBalance": availableBalance,
    };
  }
}
