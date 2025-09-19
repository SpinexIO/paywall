import 'package:paywall/models/wallet/wallet_owner_create_request.dart';
import 'package:paywall/models/wallet/wallet_owner_create_response.dart';
import 'package:paywall/models/wallet/wallet_owner_detail_response.dart';
import 'package:paywall/models/wallet/wallet_owner_identity_response.dart';
import 'package:paywall/models/wallet/wallet_owner_list_response.dart';
import 'package:paywall/models/wallet/wallet_owner_update_request.dart';
import 'package:paywall/services/base_service.dart';

import '../../models/base_response.dart';
import '../../models/wallet/wallet_owner_list_request.dart';
import '../../utils/api_constants.dart';

/// Service responsible for wallet owner related API calls
/// Hint: Handles list, detail, and possible future wallet owner operations.
class WalletOwnerService extends BaseService {
  /// Fetches wallet owner list with pagination and filtering
  /// Hint: Calls GET /walletowner endpoint.
  Future<BaseResponse<WalletOwnerListData>> getWalletOwners(WalletOwnerListRequest request) async {

    final response = await get(
      "${ApiConstants.baseUrl}/v1/walletowner",
      fromJsonT: (json) => WalletOwnerListData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }

    /// Creates a new wallet owner
  /// Hint: Calls POST /v1/walletowner
  Future<BaseResponse<WalletOwnerCreateResponseData>> createWalletOwner(WalletOwnerCreateRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/walletowner",
      data: request.toJson(),
      fromJsonT: (json) => WalletOwnerCreateResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
    /// Fetches wallet owner detail by ID
  /// Hint: Calls GET /v1/walletowner/by/id/{id}
  Future<BaseResponse<WalletOwnerDetailResponseData>> getWalletOwnerById(String id) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/walletowner/by/id/$id",
      fromJsonT: (json) => WalletOwnerDetailResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Deletes a wallet owner by ID
  /// Hint: Calls DELETE /v1/walletowner/by/id/{id}
  Future<BaseResponse<void>> deleteWalletOwner(String id) async {
    final response = await delete("${ApiConstants.baseUrl}/v1/walletowner/by/id/$id", requiresAuth: true, fromJsonT :(json) => null);
    return response;
  }
  /// Updates wallet owner information
  /// Hint: Calls PUT /v1/walletowner
  Future<BaseResponse<WalletOwnerDetailResponseData>> updateWalletOwner(WalletOwnerUpdateRequest request) async {
    final response = await put(
      "${ApiConstants.baseUrl}/v1/walletowner",
      data: request.toJson(),
      fromJsonT: (json) => WalletOwnerDetailResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Fetches wallet owner detail by identity number
  /// Hint: Calls GET /v1/walletowner/by/identity/{identity}
  Future<BaseResponse<WalletOwnerIdentityResponseData>> getWalletOwnerByIdentity(String identity) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/walletowner/by/identity/$identity",
      fromJsonT: (json) => WalletOwnerIdentityResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }

  /// Fetches wallet owner detail by tax number
  /// Hint: Calls GET /v1/walletowner/by/taxnumber/{taxNumber}
  Future<BaseResponse<WalletOwnerIdentityResponseData>> getWalletOwnerByTaxNumber(String taxNumber) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/walletowner/by/taxnumber/$taxNumber",
      fromJsonT: (json) => WalletOwnerIdentityResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }

}
