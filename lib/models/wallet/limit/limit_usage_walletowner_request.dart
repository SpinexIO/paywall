class LimitUsageWalletOwnerRequest {
  final String id;
  final int category;
  final int pageNumber;
  final int pageSize;

  LimitUsageWalletOwnerRequest({required this.id, required this.category, required this.pageNumber, required this.pageSize});

  Map<String, dynamic> toQueryParams() {
    return <String, dynamic>{"Category": category.toString(), "PageNumber": pageNumber.toString(), "PageSize": pageSize.toString()};
  }
}
