import 'package:paywall/client/api_client.dart';
import 'package:paywall/models/physical_pos/terminal/terminal_models.dart';


/// Service for retrieving terminal information.
class TerminalService {
  final ApiClient _apiClient = ApiClient();

  /// Fetches a paginated list of terminals across all connections.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<TerminalResponse> getTerminals({required TerminalRequest request}) async {
    final response = await _apiClient.post(
      "/api/terminal/list",
      data: request.toJson(),
      requiresAuth: true,
    );

    return TerminalResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Fetches a paginated list of terminals for a specific connection.
  ///
  /// [connectionId] - The ID of the connection whose terminals you want to list.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<TerminalResponse> getTerminalsByConnection({
    required String connectionId,
    required TerminalRequest request,
  }) async {
    final response = await _apiClient.post(
      "/api/terminal/$connectionId/list",
      data: request.toJson(),
      requiresAuth: true,
    );

    return TerminalResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Sends a synchronization command for terminals of a specific connection.
  ///
  /// [connectionId] - The ID of the connection whose terminals you want to sync.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<bool> syncTerminals({required String connectionId}) async {
    final response = await _apiClient.post(
      "/api/terminal/sync",
      data: {"ConnectionId": connectionId},
      requiresAuth: true,
    );

    final Map<String, dynamic> json = response.data as Map<String, dynamic>;

    // API returns { "Result": true, ... }
    return json["Result"] as bool? ?? false;
  }
  /// Checks whether a terminal is currently connected to Paywall.
  ///
  /// [terminalId] - The unique identifier (GUID) of the terminal.
  /// [terminalTagCode] - Optional tag code of the terminal (can be empty).
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<bool> checkTerminalConnectivity({
    required String terminalId,
    String terminalTagCode = "",
  }) async {
    final response = await _apiClient.post(
      "/api/terminal/connectivity/check",
      data: {"TerminalId": terminalId, "TerminalTagCode": terminalTagCode},
      requiresAuth: true,
    );

    final Map<String, dynamic> json = response.data as Map<String, dynamic>;

    // API returns: { "Result": { "IsSocketConnected": true }, ... }
    final result = json["Result"] as Map<String, dynamic>?;
    return result?["IsSocketConnected"] as bool? ?? false;
  }
  /// Fetches tags assigned to a specific terminal.
  ///
  /// [terminalId] - The GUID of the terminal.
  /// [pageIndex] - Page index for pagination.
  /// [pageSize] - Page size for pagination.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<Map<String, dynamic>> getTerminalTags({
    required String terminalId,
    int pageIndex = 0,
    int pageSize = 10,
  }) async {
    final response = await _apiClient.post(
      "/api/terminal/tag/list",
      data: {"pageIndex": pageIndex, "pageSize": pageSize, "terminalId": terminalId},
      requiresAuth: true,
    );

    return response.data as Map<String, dynamic>;
  }
  /// Adds a new tag to a terminal.
  ///
  /// [terminalId] - The GUID of the terminal.
  /// [name] - Human-readable tag name (e.g., branch and device).
  /// [code] - Unique code representing the tag (must be unique across tags).
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<bool> addTerminalTag({
    required String terminalId,
    required String name,
    required String code,
  }) async {
    final response = await _apiClient.post(
      "/api/terminal/tag",
      data: {"TerminalId": terminalId, "Name": name, "Code": code},
      requiresAuth: true,
    );

    final Map<String, dynamic> json = response.data as Map<String, dynamic>;

    // API returns: { "result": { "status": true }, ... }
    final result = json["result"] as Map<String, dynamic>?;
    return result?["status"] as bool? ?? false;
  }
  /// Updates an existing terminal tag.
  ///
  /// [terminalTagId] - The GUID of the terminal tag.
  /// [name] - Updated name of the tag.
  /// [code] - Updated unique code for the tag (must remain unique).
  /// [isActive] - Whether the tag is active.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<bool> updateTerminalTag({
    required String terminalTagId,
    required String name,
    required String code,
    required bool isActive,
  }) async {
    final response = await _apiClient.put(
      "/api/terminal/tag",
      data: {"TerminalTagId": terminalTagId, "Name": name, "Code": code, "IsActive": isActive},
      requiresAuth: true,
    );

    final Map<String, dynamic> json = response.data as Map<String, dynamic>;

    // API returns: { "result": { "status": true }, ... }
    final result = json["result"] as Map<String, dynamic>?;
    return result?["status"] as bool? ?? false;
  }
  /// Deletes a terminal tag by its ID.
  ///
  /// [terminalTagId] - The GUID of the terminal tag to be deleted.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<bool> deleteTerminalTag({required String terminalTagId}) async {
    final response = await _apiClient.delete(
      "/api/terminal/tag",
      data: {"TerminalTagId": terminalTagId},
      requiresAuth: true,
    );

    final Map<String, dynamic> json = response.data as Map<String, dynamic>;

    // API returns: { "result": { "status": true }, ... }
    final result = json["result"] as Map<String, dynamic>?;
    return result?["status"] as bool? ?? false;
  }


}
