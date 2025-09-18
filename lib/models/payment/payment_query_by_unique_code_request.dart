/// PaymentQueryByUniqueCodeRequest model
/// Represents the request for payment inquiry by UniqueCode.
class PaymentQueryByUniqueCodeRequest {
  /// Unique code assigned by Paywall at the time of payment.
  final String uniqueCode;

  PaymentQueryByUniqueCodeRequest({required this.uniqueCode});

  /// Converts the request into headers required by the API.
  Map<String, dynamic> toHeaders() => {'uniquecode': uniqueCode};
}
