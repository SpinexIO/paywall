/// Request model for Campaign Inquiry API
class CampaignInquiryRequest {
  final int currencyId;
  final double amount;
  final CardInfo card;

  CampaignInquiryRequest({required this.currencyId, required this.amount, required this.card});

  Map<String, dynamic> toJson() {
    return {'CurrencyId': currencyId, 'Amount': amount, 'Card': card.toJson()};
  }
}

class CardInfo {
  final PartnerInfo partner;
  final bool isSavedCard;
  final String uniqueCode;
  final String number;
  final String expireMonth;
  final String expireYear;

  CardInfo({
    required this.partner,
    required this.isSavedCard,
    required this.uniqueCode,
    required this.number,
    required this.expireMonth,
    required this.expireYear,
  });

  Map<String, dynamic> toJson() {
    return {
      'Partner': partner.toJson(),
      'IsSavedCard': isSavedCard,
      'UniqueCode': uniqueCode,
      'Number': number,
      'ExpireMonth': expireMonth,
      'ExpireYear': expireYear,
    };
  }
}

class PartnerInfo {
  final bool partnerBased;
  final String partnerIdentity;

  PartnerInfo({required this.partnerBased, required this.partnerIdentity});

  Map<String, dynamic> toJson() {
    return {'PartnerBased': partnerBased, 'PartnerIdentity': partnerIdentity};
  }
}
