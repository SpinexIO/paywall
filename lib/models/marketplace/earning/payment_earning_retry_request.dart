/// Request model for retrying a payment earning transaction.
/// Optionally allows changing the reflection date.
class PaymentEarningRetryRequest {
  final int paymentId;
  final bool changeReflectionDate;
  final DateTime? reflectionDate;

  PaymentEarningRetryRequest({required this.paymentId, required this.changeReflectionDate, this.reflectionDate});

  Map<String, dynamic> toJson() {
    return {
      'PaymentId': paymentId,
      'ChangeReflectionDate': changeReflectionDate,
      if (reflectionDate != null) 'ReflectionDate': reflectionDate!.toIso8601String(),
    };
  }
}
