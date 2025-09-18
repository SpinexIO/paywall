/// Represents the request payload for creating a temporary card token.
class TempCardRequest {
  /// 1: ECom, 2: Insurance
  final int cardType;

  /// Name of the card owner.
  final String cardOwnerName;

  /// Card number (required for ECom scope).
  final String? cardNumber;

  /// Card CVV (required for ECom scope).
  final String? cardCvv;

  /// Card expiry month (required for ECom scope).
  final String? cardExpiryMonth;

  /// Card expiry year (required for ECom scope).
  final String? cardExpiryYear;

  /// First 8 digits of card number (required for Insurance scope).
  final String? cardNoFirst;

  /// Last 4 digits of card number (required for Insurance scope).
  final String? cardNoLast;

  /// Identity number of card owner (required for Insurance scope).
  final String? identityNumber;

  /// How many minutes the token will be valid (0–30).
  final int expiryMin;

  /// Creates a new [TempCardRequest].
  TempCardRequest({
    required this.cardType,
    required this.cardOwnerName,
    this.cardNumber,
    this.cardCvv,
    this.cardExpiryMonth,
    this.cardExpiryYear,
    this.cardNoFirst,
    this.cardNoLast,
    this.identityNumber,
    required this.expiryMin,
  });

  /// Converts this [TempCardRequest] to JSON map.
  Map<String, dynamic> toJson() {
    return {
      "CardType": cardType,
      "CardOwnerName": cardOwnerName,
      if (cardNumber != null) "CardNumber": cardNumber,
      if (cardCvv != null) "CardCvv": cardCvv,
      if (cardExpiryMonth != null) "CardExpiryMonth": cardExpiryMonth,
      if (cardExpiryYear != null) "CardExpiryYear": cardExpiryYear,
      if (cardNoFirst != null) "CardNoFirst": cardNoFirst,
      if (cardNoLast != null) "CardNoLast": cardNoLast,
      if (identityNumber != null) "IdentityNumber": identityNumber,
      "ExpiryMin": expiryMin,
    };
  }
}
