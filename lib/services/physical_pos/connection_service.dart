import '../../client/api_client.dart';
import '../../models/physical_pos/connection/connection_create.dart';
import '../../models/physical_pos/connection/connection_delete.dart';
import '../../models/physical_pos/connection/connection_detail.dart';
import '../../models/physical_pos/connection/connection_disconnect.dart';
import '../../models/physical_pos/connection/connection_models.dart';
import '../../models/physical_pos/connection/connection_reconnect.dart';
import '../../models/physical_pos/connection/connection_update.dart';

/// Service for retrieving connection list and details.
class ConnectionService {
  final ApiClient _apiClient = ApiClient();

  /// Fetches the connection list with pagination.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<ConnectionResponse> getConnections({required ConnectionRequest request, required String apiKeyPrivate, required String apiClientPrivate}) async {
    final response = await _apiClient.post(
      "/api/connection/list",
      data: request.toJson(),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return ConnectionResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Fetches detailed information of a single connection by ID.
  ///
  /// [connectionId] - The connection identifier.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<ConnectionDetailResponse> getConnectionDetail({required String connectionId, required String apiKeyPrivate, required String apiClientPrivate}) async {
    final response = await _apiClient.get(
      "/api/connection/$connectionId/detail",
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return ConnectionDetailResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Creates a new connection.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<ConnectionCreateResponse> createConnection({
    required ConnectionCreateRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await _apiClient.post(
      "/api/connection",
      data: request.toJson(),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return ConnectionCreateResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Updates an existing connection.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<ConnectionUpdateResponse> updateConnection({
    required ConnectionUpdateRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await _apiClient.put(
      "/api/connection",
      data: request.toJson(),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return ConnectionUpdateResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Deletes a connection by ID.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<ConnectionDeleteResponse> deleteConnection({
    required ConnectionDeleteRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await _apiClient.delete(
      "/api/connection",
      data: request.toJson(),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return ConnectionDeleteResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Disconnects (deactivates) a connection by ID.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<ConnectionDisconnectResponse> disconnectConnection({
    required ConnectionDisconnectRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await _apiClient.put(
      "/api/connection/disconnect",
      data: request.toJson(),
      headers: {
        'apikeyprivate': apiKeyPrivate,
        'apiclientprivate': apiClientPrivate,
      },
    );

    return ConnectionDisconnectResponse.fromJson(
        response.data as Map<String, dynamic>);
  }


  /// Reconnects a previously disconnected connection by ID.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<ConnectionReconnectResponse> reconnectConnection({
    required ConnectionReconnectRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await _apiClient.put(
      "/api/connection/reconnect",
      data: request.toJson(),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return ConnectionReconnectResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
