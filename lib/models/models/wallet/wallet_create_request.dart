/// Wallet Create Request model
/// Hint: Represents the payload required to create a new wallet.
class WalletCreateRequest {
  final String walletOwnerId;
  final String name;
  final int regionId;
  final String currencyCode;
  final String alias;
  final String? description;
  final bool allowOverdraft;
  final double overdraftLimit;

  WalletCreateRequest({
    required this.walletOwnerId,
    required this.name,
    required this.regionId,
    required this.currencyCode,
    required this.alias,
    this.description,
    required this.allowOverdraft,
    required this.overdraftLimit,
  });

  /// Converts [WalletCreateRequest] to JSON
  Map<String, dynamic> toJson() {
    return {
      "WalletOwnerId": walletOwnerId,
      "Name": name,
      "RegionId": regionId,
      "CurrencyCode": currencyCode,
      "Alias": alias,
      "Description": description,
      "AllowOverdraft": allowOverdraft,
      "OverdraftLimit": overdraftLimit,
    };
  }
}
