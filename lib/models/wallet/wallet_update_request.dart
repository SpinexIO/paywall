/// Wallet Update Request model
/// Hint: Represents the payload required to update a wallet.
class WalletUpdateRequest {
  final String id;
  final String name;

  WalletUpdateRequest({required this.id, required this.name});

  /// Converts [WalletUpdateRequest] to JSON
  Map<String, dynamic> toJson() {
    return {"Id": id, "Name": name};
  }
}
