
import 'package:paywall/client/api_client.dart';
import 'package:paywall/models/physical_pos/tempcard/tempcard_request.dart';
import 'package:paywall/models/physical_pos/tempcard/tempcard_response.dart';

/// Service for managing temporary card tokens.
class TempCardService {
  final ApiClient _apiClient = ApiClient();

  /// Creates a temporary card token using the provided [request].
  ///
  /// Requires a valid authorization token set in [ApiClient].
  Future<TempCardResponse> createTempCard(TempCardRequest request) async {
    final response = await _apiClient.post("/api/paywall/tempcard", data: request.toJson(), requiresAuth: true);

    return TempCardResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
