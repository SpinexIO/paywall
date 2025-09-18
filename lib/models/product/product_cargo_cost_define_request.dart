/// Request model for defining cargo cost of a product.
class ProductCargoCostDefineRequest {
  final int productId;
  final int cargoOwnerType;
  final double cargoCost;

  ProductCargoCostDefineRequest({required this.productId, required this.cargoOwnerType, required this.cargoCost});

  /// Converts model to JSON for API request body.
  Map<String, dynamic> toJson() {
    return {'ProductId': productId, 'CargoOwnerType': cargoOwnerType, 'CargoCost': cargoCost};
  }
}
