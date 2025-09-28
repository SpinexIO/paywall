class ListBlockBalanceRequest {
  final String walletId;
  final int pageNumber;
  final int pageSize;

  ListBlockBalanceRequest({required this.walletId, required this.pageNumber, required this.pageSize});

  Map<String, dynamic> toQueryParams() {
    return <String, dynamic>{"walletId": walletId, "pageNumber": pageNumber.toString(), "pageSize": pageSize.toString()};
  }
}
