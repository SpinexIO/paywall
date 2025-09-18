/// Represents a request for obtaining or refreshing an access token.
class TokenRequest {
  /// The client ID provided by Paywall.
  final String clientId;

  /// The client secret provided by Paywall.
  final String clientSecret;

  /// The grant type (e.g., "client_credentials" or "refresh_token").
  final String grantType;

  /// Optional audience field.
  final String? audience;

  /// The refresh token used when grant type is "refresh_token".
  final String? refreshToken;

  /// Creates a new [TokenRequest].
  TokenRequest({required this.clientId, required this.clientSecret, required this.grantType, this.audience, this.refreshToken});

  /// Converts this [TokenRequest] into a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {'client_id': clientId, 'client_secret': clientSecret, 'grant_type': grantType};

    if (audience != null) {
      json['audience'] = audience;
    }
    if (refreshToken != null) {
      json['refresh_token'] = refreshToken;
    }

    return json;
  }
}
