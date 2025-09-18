import 'package:paywall/models/auth/token_request.dart';
import 'package:paywall/models/auth/token_response.dart';
import 'package:paywall/models/base_response.dart';
import 'package:paywall/services/base_service.dart';

import '../utils/api_constants.dart';

/// Service for handling authentication and token management.
class AuthService  extends BaseService{

  /// Requests a new access token using the client credentials flow.
  Future<BaseResponse<TokenResponse>> getToken({required String clientId, required String clientSecret, String? audience}) async {
    final request = TokenRequest(clientId: clientId, clientSecret: clientSecret, grantType: "client_credentials", audience: audience);
    final response = await post(ApiConstants.authToken, data: request.toJson(), fromJsonT: (json) => TokenResponse.fromJson(json));
    return response;
  }
}

