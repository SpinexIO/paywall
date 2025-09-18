/// Represents the API response for TempCard creation.
class TempCardResponse {
  /// Error code returned by the service (0 if successful).
  final int errorCode;

  /// Whether the operation was successful.
  final bool result;

  /// Human-readable message about the operation.
  final String message;

  /// Detailed body information.
  final TempCardBody? body;

  TempCardResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory TempCardResponse.fromJson(Map<String, dynamic> json) {
    return TempCardResponse(
      errorCode: json['ErrorCode'] as int,
      result: json['Result'] as bool,
      message: json['Message'] as String,
      body: json['Body'] != null ? TempCardBody.fromJson(json['Body'] as Map<String, dynamic>) : null,
    );
  }
}

/// Detailed response body for TempCard.
class TempCardBody {
  /// The temporary card identifier.
  final int tempCardId;

  /// The generated card token.
  final String cardToken;

  /// Expiry date and time of the token.
  final DateTime expiryDateTime;

  TempCardBody({required this.tempCardId, required this.cardToken, required this.expiryDateTime});

  factory TempCardBody.fromJson(Map<String, dynamic> json) {
    return TempCardBody(
      tempCardId: json['TempCardId'] as int,
      cardToken: json['CardToken'] as String,
      expiryDateTime: DateTime.parse(json['ExpiryDateTime'] as String),
    );
  }
}
