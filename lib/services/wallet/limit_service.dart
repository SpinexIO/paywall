import 'package:paywall/models/base_response.dart';
import 'package:paywall/models/limit/limit_create_request.dart';
import 'package:paywall/models/limit/limit_create_wallet_owner_request.dart';
import 'package:paywall/models/wallet/limit/limit_usage_wallet_request.dart';
import 'package:paywall/models/wallet/limit/limit_usage_wallet_response.dart';
import 'package:paywall/models/wallet/limit/limit_usage_walletowner_request.dart';
import 'package:paywall/models/wallet/limit/limit_usage_walletowner_response.dart';
import 'package:paywall/models/wallet/limit/update_limit_request.dart';
import 'package:paywall/models/wallet/limit_response.dart';
import 'package:paywall/models/wallet/paginated_response.dart';
import 'package:paywall/services/base_service.dart';
import 'package:paywall/utils/api_constants.dart';

class LimitService extends BaseService {
  /// Creates a new merchant-wide limit
  /// Hint: Calls POST /v1/limit/by/merchant
  Future<BaseResponse<String>> createLimit(LimitCreateRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/limit/by/merchant",
      data: request.toJson(),
      fromJsonT: (json) => json.toString(),
      requiresAuth: true,
    );
    return response;
  }
  /// Creates a new limit for a specific wallet owner
  /// Hint: Calls POST /v1/limit/by/walletowner
  Future<BaseResponse<String>> createLimitForWalletOwner(LimitCreateWalletOwnerRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/limit/by/walletowner",
      data: request.toJson(),
      fromJsonT: (json) => json.toString(),
      requiresAuth: true,
    );
    return response;
  }
  /// Creates a new limit for a specific wallet
  /// Hint: Calls POST /v1/limit/by/wallet
  Future<BaseResponse<String>> createLimitForWallet(LimitCreateRequest request) async {
    final response = await post("${ApiConstants.baseUrl}/v1/limit/by/wallet", data: request.toJson(), fromJsonT: (json) => json.toString(), requiresAuth: true);
    return response;
  }
  /// Retrieves a paginated list of limits
  /// Hint: Calls GET /v1/limit
  Future<BaseResponse<PaginatedResponse<LimitResponse>>> getLimits({required int pageNumber, required int pageSize, int? regionId}) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/limit",
      queryParameters: {"PageNumber": pageNumber, "PageSize": pageSize, if (regionId != null) "regionId": regionId},
      fromJsonT: (json) => PaginatedResponse<LimitResponse>.fromJson(json, (item) => LimitResponse.fromJson(item)),
      requiresAuth: true,
    );
    return response;
  }
  /// Deletes a limit record by Id.
  /// Hint: Calls DELETE /v1/limit
  Future<BaseResponse<bool>> deleteLimit(String id) {

    return delete<bool>('${ApiConstants.baseUrl}/v1/limit', data: {"Id": id},requiresAuth:true, fromJsonT: (dynamic json) => (json as bool?) ?? false);
  }
  /// Updates an existing limit record.
  /// Hint: Calls PUT /v1/limit
  Future<BaseResponse<bool>> updateLimit({required String apikeypublic, required String apiclientpublic, required UpdateLimitRequest request}) {
    final headers = <String, String>{'apikeypublic': apikeypublic, 'apiclientpublic': apiclientpublic};

    return put<bool>('${ApiConstants.baseUrl}/v1/limit', data: request.toJson(), headers: headers, fromJsonT: (dynamic json) => (json as bool?) ?? false);
  }


  /// Deletes limit records by merchant and region.
  /// Hint: Calls DELETE /v1/limit/by/merchant
  Future<BaseResponse<bool>> deleteLimitByMerchant({
    required String regionId,
  }) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/v1/limit/by/merchant',
      data: {"RegionId": regionId},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Deletes limit records by wallet owner and region.
  /// Hint: Calls DELETE /v1/limit/by/walletowner
  Future<BaseResponse<bool>> deleteLimitByWalletOwner({
    required String walletOwnerId,
    required String regionId,
  }) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/v1/limit/by/walletowner',
      data: {"WalletOwnerId": walletOwnerId, "RegionId": regionId},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Gets limit usage records by wallet.
  /// Hint: Calls GET /v1/limit/usage/by/wallet/:id
  Future<BaseResponse<LimitUsageWalletListData>> getLimitUsageByWallet({required LimitUsageWalletRequest request}) {
    return get<LimitUsageWalletListData>(
      '${ApiConstants.baseUrl}/v1/limit/usage/by/wallet/${request.id}',
      queryParameters: request.toQueryParams(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => LimitUsageWalletListData.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Gets limit usage records by wallet owner.
  /// Hint: Calls GET /v1/limit/usage/by/walletowner/:id
  Future<BaseResponse<LimitUsageWalletOwnerListData>> getLimitUsageByWalletOwner({required LimitUsageWalletOwnerRequest request}) {
    return get<LimitUsageWalletOwnerListData>(
      '${ApiConstants.baseUrl}/v1/limit/usage/by/walletowner/${request.id}',
      queryParameters: request.toQueryParams(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => LimitUsageWalletOwnerListData.fromJson(json as Map<String, dynamic>),
    );
  }
}
