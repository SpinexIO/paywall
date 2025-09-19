import 'package:paywall/models/wallet/balance/create_gift_balance_by_alias_request.dart';
import 'package:paywall/models/wallet/balance/create_gift_balance_by_alias_response.dart';
import 'package:paywall/models/wallet/balance/get_gift_balance_by_id_response.dart';
import 'package:paywall/models/wallet/balance/get_gift_balance_by_wallet_response.dart';
import 'package:paywall/utils/api_constants.dart';

import '../../models/base_response.dart';
import '../../models/wallet/balance/create_gift_balance_request.dart';
import '../../models/wallet/balance/create_gift_balance_response.dart';
import '../../services/base_service.dart';

class BalanceService extends BaseService {

  /// Creates a gift balance for a given wallet.
  /// Hint: Calls POST /v1/balance/gift
  Future<BaseResponse<GiftBalanceResponseData>> createGiftBalance({required CreateGiftBalanceRequest request}) {
    return post<GiftBalanceResponseData>(
      '${ApiConstants.baseUrl}/v1/balance/gift',
      data: request.toJson(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => GiftBalanceResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Creates a gift balance for a given wallet by alias.
  /// Hint: Calls POST /v1/balance/gift/by/wallet/alias
  Future<BaseResponse<GiftBalanceByAliasResponseData>> createGiftBalanceByAlias({required CreateGiftBalanceByAliasRequest request}) {
    return post<GiftBalanceByAliasResponseData>(
      '${ApiConstants.baseUrl}/v1/balance/gift/by/wallet/alias',
      data: request.toJson(),
      requiresAuth: true,
      fromJsonT: (dynamic json) => GiftBalanceByAliasResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Gets a gift balance record by its Id.
  /// Hint: Calls GET /v1/balance/gift/:id
  Future<BaseResponse<GiftBalanceByIdResponseData>> getGiftBalanceById({required String id}) {
    return get<GiftBalanceByIdResponseData>(
      '${ApiConstants.baseUrl}/v1/balance/gift/$id',
      requiresAuth: true,
      fromJsonT: (dynamic json) => GiftBalanceByIdResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Gets all gift balance records by wallet Id.
  /// Hint: Calls GET /v1/balance/gift/by/wallet/:id
  Future<BaseResponse<GiftBalanceByWalletListData>> getGiftBalanceByWallet({required String walletId}) {
    return get<GiftBalanceByWalletListData>(
      '${ApiConstants.baseUrl}/v1/balance/gift/by/wallet/$walletId',
      requiresAuth: true,
      fromJsonT: (dynamic json) => GiftBalanceByWalletListData.fromJson(json),
    );
  }
  /// Deletes a gift balance record by Id.
  /// Hint: Calls DELETE /v1/balance/gift
  Future<BaseResponse<bool>> deleteGiftBalance({required String id}) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/v1/balance/gift',
      data: {"Id": id},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
  /// Deletes all gift balance records by WalletId.
  /// Hint: Calls DELETE /v1/balance/gift/by/wallet
  Future<BaseResponse<bool>> deleteGiftBalanceByWallet({required String walletId}) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/v1/balance/gift/by/wallet',
      data: {"WalletId": walletId},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
}
