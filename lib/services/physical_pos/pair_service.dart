import 'package:paywall/client/api_client.dart';
import 'package:paywall/models/physical_pos/pair/async/pair_async_confirm_response.dart';
import 'package:paywall/models/physical_pos/pair/async/pair_async_request_cancel_response.dart';
import 'package:paywall/models/physical_pos/pair/async/pair_async_request_response.dart';
import 'package:paywall/models/physical_pos/pair/async/pair_async_unpair_response.dart';
import 'package:paywall/models/physical_pos/pair/sync/pair_sync_request.dart';
import 'package:paywall/models/physical_pos/pair/sync/pair_sync_request_cancel_request.dart';
import 'package:paywall/models/physical_pos/pair/sync/pair_sync_request_cancel_response.dart';
import 'package:paywall/models/physical_pos/pair/sync/pair_sync_response.dart';
import 'package:paywall/models/physical_pos/pair/sync/pair_sync_unpair_request.dart';
import 'package:paywall/models/physical_pos/pair/sync/pair_sync_unpair_response.dart';

/// Service for managing async pair requests for terminals.
class PairService {
  final ApiClient _apiClient = ApiClient();

  /// Sends an async pair request for a terminal.
  ///
  /// You must provide either [terminalId] OR [terminalTagCode].
  /// Do not send both at the same time, otherwise the API will return a warning.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PairAsyncRequestResponse> requestAsyncPair({
    String? terminalId,
    String? terminalTagCode,
  }) async {
    final body = <String, dynamic>{};

    if (terminalId != null) {
      body['TerminalId'] = terminalId;
    } else if (terminalTagCode != null) {
      body['TerminalTagCode'] = terminalTagCode;
    }

    final response = await _apiClient.post(
      "/api/pair/async/request",
      data: body,
      requiresAuth: true,
    );

    final result = (response.data as Map<String, dynamic>)['Result'] as Map<String, dynamic>;

    return PairAsyncRequestResponse.fromJson(result);
  }
  /// Confirms an async pair request using the [pairAsyncRequestId].
  ///
  /// Returns the [TerminalPairId] which identifies the terminal pair.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PairAsyncConfirmResponse> confirmAsyncPair({
    required String pairAsyncRequestId,
  }) async {
    final response = await _apiClient.put(
      "/api/pair/async/confirm",
      data: {'PairAsyncRequestId': pairAsyncRequestId},
      requiresAuth: true,
    );

    final result = (response.data as Map<String, dynamic>)['Result'] as Map<String, dynamic>;

    return PairAsyncConfirmResponse.fromJson(result);
  }

  /// Unpairs an async pair using the [terminalTagCode].
  ///
  /// Returns the [TerminalPairId] of the unpaired terminal.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PairAsyncUnpairResponse> unpairAsync({required String terminalTagCode}) async {
    final response = await _apiClient.delete(
      "/api/pair/async/unpair",
      data: {'TerminalTagCode': terminalTagCode},
      requiresAuth: true,
    );

    final result = (response.data as Map<String, dynamic>)['Result'] as Map<String, dynamic>;

    return PairAsyncUnpairResponse.fromJson(result);
  }

  /// Cancels an async pair request by [pairAsyncRequestId].
  ///
  /// Returns the canceled [PairRequestId].
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PairAsyncRequestCancelResponse> cancelAsyncPairRequest({
    required String pairAsyncRequestId,
  }) async {
    final response = await _apiClient.delete(
      "/api/pair/async/request/delete",
      data: {'PairAsyncRequestId': pairAsyncRequestId},
      requiresAuth: true,
    );

    final result = (response.data as Map<String, dynamic>)['Result'] as Map<String, dynamic>;

    return PairAsyncRequestCancelResponse.fromJson(result);
  }



  /// Sends a sync pair request to a terminal.
  ///
  /// Either [terminalId] or [terminalTagCode] must be provided.
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PairSyncResponse> requestSyncPair({
    required PairSyncRequest request,
  }) async {
    final response = await _apiClient.post(
      "/api/pair/sync/request",
      data: request.toJson(),
      requiresAuth: true
    );

    final result =
        (response.data as Map<String, dynamic>)['Result'] as Map<String, dynamic>;

    return PairSyncResponse.fromJson(result);
  }


  /// Unpairs (disconnects) a sync pair from a terminal.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PairSyncUnpairResponse> unpairSync({
    required PairSyncUnpairRequest request,
  }) async {
    final response = await _apiClient.delete(
      "/api/pair/sync/unpair",
      data: request.toJson(),
      requiresAuth: true
    );

    final result =
        (response.data as Map<String, dynamic>)['Result'] as Map<String, dynamic>;

    return PairSyncUnpairResponse.fromJson(result);
  }



  /// Cancels a sync pair request.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PairSyncRequestCancelResponse> cancelSyncPairRequest({
    required PairSyncRequestCancelRequest request,
  }) async {
    final response = await _apiClient.delete(
      "/api/pair/sync/request/delete",
      data: request.toJson(),
      requiresAuth: true
    );

    final result =
        (response.data as Map<String, dynamic>)['Result'] as Map<String, dynamic>;

    return PairSyncRequestCancelResponse.fromJson(result);
  }


}
