/// Response model for product cargo cost API.
class ProductCargoCostResponse {
  final int id;
  final int currencyId;
  final int cargoOwnerType;
  final double cargoCost;

  ProductCargoCostResponse({required this.id, required this.currencyId, required this.cargoOwnerType, required this.cargoCost});

  factory ProductCargoCostResponse.fromJson(Map<String, dynamic> json) {
    return ProductCargoCostResponse(
      id: json['Id'] ?? 0,
      currencyId: json['CurrencyId'] ?? 0,
      cargoOwnerType: json['CargoOwnerType'] ?? 0,
      cargoCost: (json['CargoCost'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Id': id, 'CurrencyId': currencyId, 'CargoOwnerType': cargoOwnerType, 'CargoCost': cargoCost};
  }
}
