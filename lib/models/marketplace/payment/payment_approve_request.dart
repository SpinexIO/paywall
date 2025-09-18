/// PaymentApproveRequest model
/// Represents the request payload for payment-based approval.
class PaymentApproveRequest {
  /// The ID of the payment in Paywall system.
  final int paymentId;

  /// Whether the payout reflection date should be the same as the member's.
  final bool? sameReflectionDateWithMember;

  /// Optional payout settings for the approval.
  final PayoutModel? payout;

  PaymentApproveRequest({required this.paymentId, this.sameReflectionDateWithMember, this.payout});

  /// Converts the object to JSON for API request.
  Map<String, dynamic> toJson() {
    return {
      'PaymentId': paymentId,
      if (sameReflectionDateWithMember != null) 'SameReflectionDateWithMember': sameReflectionDateWithMember,
      if (payout != null) 'Payout': payout!.toJson(),
    };
  }
}

/// Nested PayoutModel used in payment approval requests.
class PayoutModel {
  /// Whether to apply a description to the payout transfer.
  final bool descriptionApply;

  /// The custom description text for the payout.
  final String description;

  PayoutModel({required this.descriptionApply, required this.description});

  Map<String, dynamic> toJson() {
    return {'DescriptionApply': descriptionApply, 'Description': description};
  }
}
