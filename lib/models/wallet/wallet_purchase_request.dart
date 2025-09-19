/// Wallet Purchase Request model
/// Hint: Represents the payload required to perform a purchase (spending) from a wallet.
class WalletPurchaseRequest {
  final String id;
  final double amount;
  final String description;
  final String externalReference;
  final bool useGiftBalances;
  final bool cashbackApply;
  final String cashbackType;
  final double cashbackValue;

  WalletPurchaseRequest({
    required this.id,
    required this.amount,
    required this.description,
    required this.externalReference,
    required this.useGiftBalances,
    required this.cashbackApply,
    required this.cashbackType,
    required this.cashbackValue,
  });

  /// Converts [WalletPurchaseRequest] to JSON
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
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
