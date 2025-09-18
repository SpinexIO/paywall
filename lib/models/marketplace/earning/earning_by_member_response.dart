/// Response model for earnings by member Id.
class EarningByMemberResponse {
  final int id;
  final bool isSubMerchant;
  final int paymentId;
  final int productId;
  final int currencyId;
  final String currency;
  final int calculationCommissionType;
  final double calculationCommission;
  final double earning;
  final int marketPlaceEarningStatusId;
  final String marketPlaceEarningStatus;
  final int marketPlaceEarningTransactionId;
  final DateTime reflectionDate;
  final DateTime calculationDateTime;

  EarningByMemberResponse({
    required this.id,
    required this.isSubMerchant,
    required this.paymentId,
    required this.productId,
    required this.currencyId,
    required this.currency,
    required this.calculationCommissionType,
    required this.calculationCommission,
    required this.earning,
    required this.marketPlaceEarningStatusId,
    required this.marketPlaceEarningStatus,
    required this.marketPlaceEarningTransactionId,
    required this.reflectionDate,
    required this.calculationDateTime,
  });

  factory EarningByMemberResponse.fromJson(Map<String, dynamic> json) {
    return EarningByMemberResponse(
      id: json['Id'],
      isSubMerchant: json['IsSubMerchant'],
      paymentId: json['PaymentId'],
      productId: json['ProductId'],
      currencyId: json['CurrencyId'],
      currency: json['Currency'],
      calculationCommissionType: json['CalculationCommissionType'],
      calculationCommission: (json['CalculationCommission'] as num).toDouble(),
      earning: (json['Earning'] as num).toDouble(),
      marketPlaceEarningStatusId: json['MarketPlaceEarningStatusId'],
      marketPlaceEarningStatus: json['MarketPlaceEarningStatus'],
      marketPlaceEarningTransactionId: json['MarketPlaceEarningTransactionId'],
      reflectionDate: DateTime.parse(json['ReflectionDate']),
      calculationDateTime: DateTime.parse(json['CalculationDateTime']),
    );
  }
}

/// Wrapper for paginated response
class EarningByMemberBody {
  final List<EarningByMemberResponse> data;
  final int totalRecord;

  EarningByMemberBody({required this.data, required this.totalRecord});

  factory EarningByMemberBody.fromJson(Map<String, dynamic> json) {
    return EarningByMemberBody(data: (json['Data'] as List).map((e) => EarningByMemberResponse.fromJson(e)).toList(), totalRecord: json['TotalRecord']);
  }
}
