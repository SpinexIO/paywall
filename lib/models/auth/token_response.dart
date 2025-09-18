/// Response model for TempToken API
class TokenResponse {
  final int errorCodeType;
  final String? errorMessage;
  final int errorCode;
  final bool result;
  final String? message;
  final TempTokenBody? body;

  TokenResponse({required this.errorCodeType, this.errorMessage, required this.errorCode, required this.result, this.message, this.body});

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      errorCodeType: json['ErrorCodeType'],
      errorMessage: json['ErrorMessage'],
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'],
      body: json['Body'] != null ? TempTokenBody.fromJson(json['Body']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'ErrorCodeType': errorCodeType,
    'ErrorMessage': errorMessage,
    'ErrorCode': errorCode,
    'Result': result,
    'Message': message,
    'Body': body?.toJson(),
  };
}

/// Body of TempToken response
class TempTokenBody {
  final int tempTokenId;
  final String token;
  final DateTime expiryDateTime;
  final TempTokenScope scope;

  TempTokenBody({required this.tempTokenId, required this.token, required this.expiryDateTime, required this.scope});

  factory TempTokenBody.fromJson(Map<String, dynamic> json) {
    return TempTokenBody(
      tempTokenId: json['TempTokenId'],
      token: json['Token'],
      expiryDateTime: DateTime.parse(json['ExpiryDateTime']),
      scope: TempTokenScope.fromJson(json['Scope']),
    );
  }

  Map<String, dynamic> toJson() => {'TempTokenId': tempTokenId, 'Token': token, 'ExpiryDateTime': expiryDateTime.toIso8601String(), 'Scope': scope.toJson()};
}

/// Scope of TempToken (permissions)
class TempTokenScope {
  final bool clientCardSave;
  final bool threeDSession;

  TempTokenScope({required this.clientCardSave, required this.threeDSession});

  factory TempTokenScope.fromJson(Map<String, dynamic> json) {
    return TempTokenScope(clientCardSave: json['ClientCardSave'], threeDSession: json['ThreeDSession']);
  }

  Map<String, dynamic> toJson() => {'ClientCardSave': clientCardSave, 'ThreeDSession': threeDSession};
}
