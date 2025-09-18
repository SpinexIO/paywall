/// Response model for product list service
class ProductListResponse {
  final int id;
  final int memberId;
  final String? productId;
  final String productName;
  final String productCategory;
  final String productDescription;
  final double productAmount;
  final bool isMarketPlaceSales;
  final Cargo? cargo;
  final Discount? discount;

  ProductListResponse({
    required this.id,
    required this.memberId,
    this.productId,
    required this.productName,
    required this.productCategory,
    required this.productDescription,
    required this.productAmount,
    required this.isMarketPlaceSales,
    this.cargo,
    this.discount,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      id: json['Id'],
      memberId: json['MemberId'],
      productId: json['ProductId'],
      productName: json['ProductName'],
      productCategory: json['ProductCategory'],
      productDescription: json['ProductDescription'],
      productAmount: (json['ProductAmount'] as num).toDouble(),
      isMarketPlaceSales: json['IsMarketPlaceSales'],
      cargo: json['Cargo'] != null ? Cargo.fromJson(json['Cargo']) : null,
      discount: json['Discount'] != null ? Discount.fromJson(json['Discount']) : null,
    );
  }
}

/// Cargo details inside a product
class Cargo {
  final int currencyId;
  final int cargoOwnerType;
  final double cargoCost;

  Cargo({required this.currencyId, required this.cargoOwnerType, required this.cargoCost});

  factory Cargo.fromJson(Map<String, dynamic> json) {
    return Cargo(currencyId: json['CurrencyId'], cargoOwnerType: json['CargoOwnerType'], cargoCost: (json['CargoCost'] as num).toDouble());
  }
}

/// Discount details inside a product
class Discount {
  final int discountOwnerType;
  final int discountType;
  final double discountValue;

  Discount({required this.discountOwnerType, required this.discountType, required this.discountValue});

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(discountOwnerType: json['DiscountOwnerType'], discountType: json['DiscountType'], discountValue: (json['DiscountValue'] as num).toDouble());
  }
}
