class PayoutQueryRequest {
  final String merchantUniqueCode;

  PayoutQueryRequest({required this.merchantUniqueCode});

  Map<String, dynamic> toQueryParams() {
    return {"merchantuniquecode": merchantUniqueCode};
  }
}
