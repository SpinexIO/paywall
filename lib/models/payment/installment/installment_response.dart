/// Response model for installment query.
class InstallmentResponse {
  final String? cardBank;
  final String? cardBrand;
  final String? cardFamily;
  final String? cardKind;
  final String? cardType;
  final List<InstallmentOption> options;

  InstallmentResponse({this.cardBank, this.cardBrand, this.cardFamily, this.cardKind, this.cardType, required this.options});

  factory InstallmentResponse.fromJson(Map<String, dynamic> json) {
    return InstallmentResponse(
      cardBank: json['CardBank'],
      cardBrand: json['CardBrand'],
      cardFamily: json['CardFamily'],
      cardKind: json['CardKind'],
      cardType: json['CardType'],
      options: (json['Options'] as List<dynamic>? ?? []).map((e) => InstallmentOption.fromJson(e)).toList(),
    );
  }
}

class InstallmentOption {
  final int paymentGatewayId;
  final String paymentGatewayName;
  final int installment;
  final double commission;
  final double interest;
  final double rawAmount;
  final double interestAmount;

  InstallmentOption({
    required this.paymentGatewayId,
    required this.paymentGatewayName,
    required this.installment,
    required this.commission,
    required this.interest,
    required this.rawAmount,
    required this.interestAmount,
  });

  factory InstallmentOption.fromJson(Map<String, dynamic> json) {
    return InstallmentOption(
      paymentGatewayId: json['PaymentGatewayId'],
      paymentGatewayName: json['PaymentGatewayName'],
      installment: json['Installment'],
      commission: (json['Commission'] as num).toDouble(),
      interest: (json['Interest'] as num).toDouble(),
      rawAmount: (json['RawAmount'] as num).toDouble(),
      interestAmount: (json['InterestAmount'] as num).toDouble(),
    );
  }
}
