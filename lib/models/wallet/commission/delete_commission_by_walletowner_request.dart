class DeleteCommissionByWalletOwnerRequest {
  final String walletOwnerId;
  final int regionId;

  DeleteCommissionByWalletOwnerRequest({required this.walletOwnerId, required this.regionId});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"WalletOwnerId": walletOwnerId, "RegionId": regionId};
  }
}
