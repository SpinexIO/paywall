/// PaymentQueryRequest model
/// Represents the request for payment inquiry by MerchantUniqueCode.
class PaymentQueryRequest {
  /// Unique merchant code provided at the time of payment initialization.
  final String merchantUniqueCode;

  PaymentQueryRequest({required this.merchantUniqueCode});

  Map<String, dynamic> toHeaders() => {'merchantuniquecode': merchantUniqueCode};
}
