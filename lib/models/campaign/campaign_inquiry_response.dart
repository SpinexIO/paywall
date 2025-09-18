/// Response model for Campaign Inquiry API
class CampaignInquiryResponse {
  final List<Campaign> campaigns;

  CampaignInquiryResponse({required this.campaigns});

  factory CampaignInquiryResponse.fromJson(Map<String, dynamic> json) {
    return CampaignInquiryResponse(campaigns: (json['Campaigns'] as List<dynamic>? ?? []).map((e) => Campaign.fromJson(e)).toList());
  }
}

class Campaign {
  final int currencyId;
  final double amount;
  final String campaignIndex;
  final String campaignCode;
  final String campaignDescription;

  Campaign({required this.currencyId, required this.amount, required this.campaignIndex, required this.campaignCode, required this.campaignDescription});

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      currencyId: json['CurrencyId'] ?? 0,
      amount: (json['Amount'] as num).toDouble(),
      campaignIndex: json['CampaignIndex'] ?? '',
      campaignCode: json['CampaignCode'] ?? '',
      campaignDescription: json['CampaignDescription'] ?? '',
    );
  }
}
