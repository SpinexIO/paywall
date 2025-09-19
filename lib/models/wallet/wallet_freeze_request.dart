/// Wallet Freeze Request model
/// Hint: Represents the payload required to freeze a wallet.
class WalletFreezeRequest {
  final String id;
  final String? frozenUntil;

  WalletFreezeRequest({required this.id, this.frozenUntil});

  /// Converts [WalletFreezeRequest] to JSON
  Map<String, dynamic> toJson() {
    return {"Id": id, "FrozenUntil": frozenUntil};
  }
}
