/// Response model for product-based debt information.
class ProductDebtResponse {
  final int debtId;
  final int type;
  final String typeName;
  final int memberId;
  final String memberName;
  final int currencyId;
  final String currency;
  final int productId;
  final double productAmount;
  final double debtAmount;
  final int debtStatusId;
  final int debtTransactionId;
  final CargoInfo? cargo;
  final DiscountInfo? discount;
  final DateTime calculationDateTime;

  ProductDebtResponse({
    required this.debtId,
    required this.type,
    required this.typeName,
    required this.memberId,
    required this.memberName,
    required this.currencyId,
    required this.currency,
    required this.productId,
    required this.productAmount,
    required this.debtAmount,
    required this.debtStatusId,
    required this.debtTransactionId,
    required this.cargo,
    required this.discount,
    required this.calculationDateTime,
  });

  factory ProductDebtResponse.fromJson(Map<String, dynamic> json) {
    return ProductDebtResponse(
      debtId: json['DebtId'],
      type: json['Type'],
      typeName: json['TypeName'],
      memberId: json['MemberId'],
      memberName: json['MemberName'],
      currencyId: json['CurrencyId'],
      currency: json['Currency'],
      productId: json['ProductId'],
      productAmount: (json['ProductAmount'] as num).toDouble(),
      debtAmount: (json['DebtAmount'] as num).toDouble(),
      debtStatusId: json['DebtStatusId'],
      debtTransactionId: json['DebtTransactionId'],
      cargo: json['Cargo'] != null ? CargoInfo.fromJson(json['Cargo']) : null,
      discount: json['Discount'] != null ? DiscountInfo.fromJson(json['Discount']) : null,
      calculationDateTime: DateTime.parse(json['CalculationDateTime']),
    );
  }
}

/// Cargo details of the debt.
class CargoInfo {
  final int cargoId;
  final int cargoOwnerType;
  final double cargoCost;

  CargoInfo({required this.cargoId, required this.cargoOwnerType, required this.cargoCost});

  factory CargoInfo.fromJson(Map<String, dynamic> json) {
    return CargoInfo(cargoId: json['CargoId'], cargoOwnerType: json['CargoOwnerType'], cargoCost: (json['CargoCost'] as num).toDouble());
  }
}

/// Discount details of the debt.
class DiscountInfo {
  final int discountId;
  final int discountOwnerType;
  final int discountType;
  final double discount;

  DiscountInfo({required this.discountId, required this.discountOwnerType, required this.discountType, required this.discount});

  factory DiscountInfo.fromJson(Map<String, dynamic> json) {
    return DiscountInfo(
      discountId: json['DiscountId'],
      discountOwnerType: json['DiscountOwnerType'],
      discountType: json['DiscountType'],
      discount: (json['Discount'] as num).toDouble(),
    );
  }
}
