/// Response model for BIN inquiry.
class BinInquiryResponse {
  final String binNumber;
  final int cardBankId;
  final String cardBank;
  final int cardBrandId;
  final String cardBrand;
  final int? cardFamilyId;
  final String? cardFamily;
  final int cardKindId;
  final String cardKind;
  final int cardTypeId;
  final String cardType;
  final bool isMatchedByEightDigitBin;
  final bool isMatchedBySixDigitBin;

  BinInquiryResponse({
    required this.binNumber,
    required this.cardBankId,
    required this.cardBank,
    required this.cardBrandId,
    required this.cardBrand,
    this.cardFamilyId,
    this.cardFamily,
    required this.cardKindId,
    required this.cardKind,
    required this.cardTypeId,
    required this.cardType,
    required this.isMatchedByEightDigitBin,
    required this.isMatchedBySixDigitBin,
  });

  factory BinInquiryResponse.fromJson(Map<String, dynamic> json) {
    return BinInquiryResponse(
      binNumber: json['BinNumber'],
      cardBankId: json['CardBankId'],
      cardBank: json['CardBank'],
      cardBrandId: json['CardBrandId'],
      cardBrand: json['CardBrand'],
      cardFamilyId: json['CardFamilyId'],
      cardFamily: json['CardFamily'],
      cardKindId: json['CardKindId'],
      cardKind: json['CardKind'],
      cardTypeId: json['CardTypeId'],
      cardType: json['CardType'],
      isMatchedByEightDigitBin: json['IsMatchedByEightDigitBin'],
      isMatchedBySixDigitBin: json['IsMatchedBySixDigitBin'],
    );
  }
}
