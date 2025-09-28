class DeleteBlockBalanceRequest {
  final String walletId;
  final String blockedBalanceId;
  final String externalReference;

  DeleteBlockBalanceRequest({required this.walletId, required this.blockedBalanceId, required this.externalReference});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"WalletId": walletId, "BlockedBalanceId": blockedBalanceId, "ExternalReference": externalReference};
  }
}
