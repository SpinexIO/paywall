/// Wallet Purchase By Alias Request model
/// Hint: Represents the payload required to perform a purchase (spending) from a wallet using alias.
class WalletPurchaseByAliasRequest {
  final String alias;
  final double amount;
  final String description;
  final String externalReference;
  final bool useGiftBalances;
  final bool cashbackApply;
  final String cashbackType;
  final double cashbackValue;

  WalletPurchaseByAliasRequest({
    required this.alias,
    required this.amount,
    required this.description,
    required this.externalReference,
    required this.useGiftBalances,
    required this.cashbackApply,
    required this.cashbackType,
    required this.cashbackValue,
  });

  /// Converts [WalletPurchaseByAliasRequest] to JSON
  Map<String, dynamic> toJson() {
    return {
      "Alias": alias,
      "Amount": amount,
      "Description": description,
      "ExternalReference": externalReference,
      "UseGiftBalances": useGiftBalances,
      "CashbackApply": cashbackApply,
      "CashbackType": cashbackType,
      "CashbackValue": cashbackValue,
    };
  }
}
