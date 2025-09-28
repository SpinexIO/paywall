class GetCommissionByWalletOwnerRequest {
  final String walletOwnerId;
  final int pageNumber;
  final int pageSize;
  final int regionId;

  GetCommissionByWalletOwnerRequest({required this.walletOwnerId, required this.pageNumber, required this.pageSize, required this.regionId});

  Map<String, dynamic> toQueryParams() {
    return <String, dynamic>{"pageNumber": pageNumber.toString(), "pageSize": pageSize.toString(), "regionId": regionId.toString()};
  }
}
