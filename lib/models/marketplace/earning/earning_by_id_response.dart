/// Response model for retrieving earning details by Id.
class EarningByIdResponse {
  final int id;
  final int paymentId;
  final int productId;
  final int merchantId;
  final int memberId;
  final bool isSubMerchant;
  final double earning;
  final DateTime reflectionDate;
  final int earningStatusId;

  EarningByIdResponse({
    required this.id,
    required this.paymentId,
    required this.productId,
    required this.merchantId,
    required this.memberId,
    required this.isSubMerchant,
    required this.earning,
    required this.reflectionDate,
    required this.earningStatusId,
  });

  factory EarningByIdResponse.fromJson(Map<String, dynamic> json) {
    return EarningByIdResponse(
      id: json['Id'] as int,
      paymentId: json['PaymentId'] as int,
      productId: json['ProductId'] as int,
      merchantId: json['MerchantId'] as int,
      memberId: json['MemberId'] as int,
      isSubMerchant: json['IsSubMerchant'] as bool,
      earning: (json['Earning'] as num).toDouble(),
      reflectionDate: DateTime.parse(json['ReflectionDate']),
      earningStatusId: json['EarningStatusId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'PaymentId': paymentId,
      'ProductId': productId,
      'MerchantId': merchantId,
      'MemberId': memberId,
      'IsSubMerchant': isSubMerchant,
      'Earning': earning,
      'ReflectionDate': reflectionDate.toIso8601String(),
      'EarningStatusId': earningStatusId,
    };
  }
}
