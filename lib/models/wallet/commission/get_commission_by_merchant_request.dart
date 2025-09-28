class GetCommissionByMerchantRequest {
  final int pageNumber;
  final int pageSize;
  final int regionId;

  GetCommissionByMerchantRequest({required this.pageNumber, required this.pageSize, required this.regionId});

  Map<String, dynamic> toQueryParams() {
    return <String, dynamic>{"pageNumber": pageNumber.toString(), "pageSize": pageSize.toString(), "regionId": regionId.toString()};
  }
}
