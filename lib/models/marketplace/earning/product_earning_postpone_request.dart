/// Request model for postponing product earning.
class ProductEarningPostponeRequest {
  final int productId;
  final int day;
  final bool applyAll;

  ProductEarningPostponeRequest({required this.productId, required this.day, required this.applyAll});

  Map<String, dynamic> toJson() {
    return {'ProductId': productId, 'Day': day, 'ApplyAll': applyAll};
  }
}
