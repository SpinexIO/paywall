import 'package:paywall/models/wallet/commission/create_commission_by_wallet_request.dart';
import 'package:paywall/models/wallet/commission/create_commission_by_wallet_response.dart';
import 'package:paywall/models/wallet/commission/create_commission_by_walletowner_request.dart';
import 'package:paywall/models/wallet/commission/create_commission_by_walletowner_response.dart';
import 'package:paywall/models/wallet/commission/delete_commission_by_walletowner_request.dart';
import 'package:paywall/models/wallet/commission/get_commission_by_id_response.dart';
import 'package:paywall/models/wallet/commission/get_commission_by_merchant_request.dart';
import 'package:paywall/models/wallet/commission/get_commission_by_merchant_response.dart';
import 'package:paywall/models/wallet/commission/get_commission_by_wallet_request.dart';
import 'package:paywall/models/wallet/commission/get_commission_by_wallet_response.dart';
import 'package:paywall/models/wallet/commission/get_commission_by_walletowner_request.dart';
import 'package:paywall/models/wallet/commission/get_commission_by_walletowner_response.dart';
import 'package:paywall/models/wallet/commission/update_commission_request.dart';
import 'package:paywall/utils/api_constants.dart';

import '../../models/base_response.dart';
import '../../models/wallet/commission/create_commission_request.dart';
import '../../models/wallet/commission/create_commission_response.dart';
import '../../services/base_service.dart';

class CommissionService extends BaseService {

  /// Creates a commission record at merchant level (system-wide).
  /// Hint: Calls POST /v1/commission/by/merchant
  Future<BaseResponse<CommissionResponseData>> createCommission({required CreateCommissionRequest request}) {
    return post<CommissionResponseData>(
      '${ApiConstants.baseUrl}/v1/commission/by/merchant',
      data: request.toJson(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CommissionResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Creates a commission record for a specific wallet owner.
  /// Hint: Calls POST /v1/commission/by/walletowner
  Future<BaseResponse<CommissionByWalletOwnerResponseData>> createCommissionByWalletOwner({required CreateCommissionByWalletOwnerRequest request}) {
    return post<CommissionByWalletOwnerResponseData>(
      '${ApiConstants.baseUrl}/v1/commission/by/walletowner',
      data: request.toJson(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CommissionByWalletOwnerResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Creates a commission record for a specific wallet.
  /// Hint: Calls POST /v1/commission/by/wallet
  Future<BaseResponse<CommissionByWalletResponseData>> createCommissionByWallet({required CreateCommissionByWalletRequest request}) {
    return post<CommissionByWalletResponseData>(
      '${ApiConstants.baseUrl}/v1/commission/by/wallet',
      data: request.toJson(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CommissionByWalletResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Gets commission details by Id.
  /// Hint: Calls GET /v1/commission/by/id/{id}
  Future<BaseResponse<CommissionByIdResponseData>> getCommissionById({required String id}) {
    return get<CommissionByIdResponseData>(
      '${ApiConstants.baseUrl}/v1/commission/by/id/$id',
      requiresAuth: true,
      fromJsonT: (dynamic json) => CommissionByIdResponseData.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Gets commission records at merchant level with pagination.
  /// Hint: Calls GET /v1/commission/by/merchant
  Future<BaseResponse<CommissionByMerchantListData>> getCommissionByMerchant({required GetCommissionByMerchantRequest request}) {
    return get<CommissionByMerchantListData>(
      '${ApiConstants.baseUrl}/v1/commission/by/merchant',
      queryParameters: request.toQueryParams(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CommissionByMerchantListData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Gets commission records for a specific wallet owner with pagination.
  /// Hint: Calls GET /v1/commission/by/walletowner/{walletOwnerId}
  Future<BaseResponse<CommissionByWalletOwnerListData>> getCommissionByWalletOwner({required GetCommissionByWalletOwnerRequest request}) {
    return get<CommissionByWalletOwnerListData>(
      '${ApiConstants.baseUrl}/v1/commission/by/walletowner/${request.walletOwnerId}',
      queryParameters: request.toQueryParams(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CommissionByWalletOwnerListData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Gets commission records for a specific wallet with pagination.
  /// Hint: Calls GET /v1/commission/by/wallet/{walletId}
  Future<BaseResponse<CommissionByWalletListData>> getCommissionByWallet({required GetCommissionByWalletRequest request}) {
    return get<CommissionByWalletListData>(
      '${ApiConstants.baseUrl}/v1/commission/by/wallet/${request.walletId}',
      queryParameters: request.toQueryParams(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CommissionByWalletListData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Updates a commission record.
  /// Hint: Calls PUT /v1/commission
  Future<BaseResponse<CommissionByWalletItem>> updateCommission({required UpdateCommissionRequest request}) {
    return put<CommissionByWalletItem>(
      '${ApiConstants.baseUrl}/v1/commission',
      data: request.toJson(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => CommissionByWalletItem.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Activates a commission record.
  /// Hint: Calls PUT /v1/commission/activate
  Future<BaseResponse<bool>> activateCommission({required String id}) {
    return put<bool>(
      '${ApiConstants.baseUrl}/v1/commission/activate',
      data: {"Id": id},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Deactivates a commission record.
  /// Hint: Calls PUT /v1/commission/deactivate
  Future<BaseResponse<bool>> deactivateCommission({required String id}) {
    return put<bool>(
      '${ApiConstants.baseUrl}/v1/commission/deactivate',
      data: {"Id": id},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Deletes a commission record by Id.
  /// Hint: Calls DELETE /v1/commission
  Future<BaseResponse<bool>> deleteCommission({required String id}) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/v1/commission',
      data: {"Id": id},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Deletes commission records at system (merchant) level by RegionId.
  /// Hint: Calls DELETE /v1/commission/by/merchant
  Future<BaseResponse<bool>> deleteCommissionByMerchant({required int regionId}) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/v1/commission/by/merchant',
      data: {"RegionId": regionId},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Deletes commission records by WalletOwner and RegionId.
  /// Hint: Calls DELETE /v1/commission/by/walletowner
  Future<BaseResponse<bool>> deleteCommissionByWalletOwner({required DeleteCommissionByWalletOwnerRequest request}) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/v1/commission/by/walletowner',
      data: request.toJson(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Deletes commission records by WalletId.
  /// Hint: Calls DELETE /v1/commission/by/wallet
  Future<BaseResponse<bool>> deleteCommissionByWallet({required String walletId}) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/v1/commission/by/wallet',
      data: {"WalletId": walletId},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
}
