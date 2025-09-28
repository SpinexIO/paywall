class GetCommissionByWalletRequest {
  final String walletId;
  final int pageNumber;
  final int pageSize;

  GetCommissionByWalletRequest({required this.walletId, required this.pageNumber, required this.pageSize});

  Map<String, dynamic> toQueryParams() {
    return <String, dynamic>{"pageNumber": pageNumber.toString(), "pageSize": pageSize.toString()};
  }
}
