class GetCampaignByNameRequest {
  final String name;
  final String currencyCode;
  final int regionId;

  GetCampaignByNameRequest({required this.name, required this.currencyCode, required this.regionId});

  Map<String, dynamic> toQueryParams() {
    return <String, dynamic>{"name": name, "currencyCode": currencyCode, "regionId": regionId.toString()};
  }
}
