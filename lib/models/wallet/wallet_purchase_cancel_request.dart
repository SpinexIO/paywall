/// Wallet Purchase Cancel Request model
/// Hint: Represents the payload required to cancel a purchase (spending) transaction.
class WalletPurchaseCancelRequest {
  final String externalReference;
  final bool rollbackFee;
  final bool rollbackCashback;

  WalletPurchaseCancelRequest({required this.externalReference, required this.rollbackFee, required this.rollbackCashback});

  /// Converts [WalletPurchaseCancelRequest] to JSON
  Map<String, dynamic> toJson() {
    return {"ExternalReference": externalReference, "RollbackFee": rollbackFee, "RollbackCashback": rollbackCashback};
  }
}
