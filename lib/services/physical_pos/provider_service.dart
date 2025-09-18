
import 'package:paywall/client/api_client.dart';
import 'package:paywall/models/physical_pos/provider/provider_models.dart';

/// Service for retrieving provider information.
class ProviderService {
  final ApiClient _apiClient = ApiClient();

  /// Fetches the full list of providers, brands, and regions.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<ProviderResponse> getProviders({required String apiKeyPrivate, required String apiClientPrivate}) async {
    final response = await _apiClient.get("/api/provider/list", headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate});

    return ProviderResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Fetches providers by region.
  ///
  /// [regionId] - The region identifier.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<ProviderResponse> getProvidersByRegion({required int regionId, required String apiKeyPrivate, required String apiClientPrivate}) async {
    final response = await _apiClient.get("/api/provider/$regionId/list", headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate});

    return ProviderResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
