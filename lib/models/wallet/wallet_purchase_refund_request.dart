/// Wallet Purchase Refund Request model
/// Hint: Represents the payload required to refund a purchase transaction.
class WalletPurchaseRefundRequest {
  final String externalReference;
  final bool rollbackFee;
  final bool rollbackCashback;

  WalletPurchaseRefundRequest({required this.externalReference, required this.rollbackFee, required this.rollbackCashback});

  /// Converts [WalletPurchaseRefundRequest] to JSON
  Map<String, dynamic> toJson() {
    return {"ExternalReference": externalReference, "RollbackFee": rollbackFee, "RollbackCashback": rollbackCashback};
  }
}
