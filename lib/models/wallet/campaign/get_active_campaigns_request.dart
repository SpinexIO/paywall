class GetActiveCampaignsRequest {
  final int pageNumber;
  final int pageSize;
  final String currencyCode;
  final int regionId;

  GetActiveCampaignsRequest({required this.pageNumber, required this.pageSize, required this.currencyCode, required this.regionId});

  Map<String, dynamic> toQueryParams() {
    return <String, dynamic>{
      "pageNumber": pageNumber.toString(),
      "pageSize": pageSize.toString(),
      "currencyCode": currencyCode,
      "regionId": regionId.toString(),
    };
  }
}
