import 'package:paywall/models/models/wallet/wallet_create_request.dart';
import 'package:paywall/models/wallet/update_transaction_description_request.dart';
import 'package:paywall/models/wallet/wallet_balance_response.dart';
import 'package:paywall/models/wallet/wallet_check_payment_availability_response.dart';
import 'package:paywall/models/wallet/wallet_deposit_by_alias_request.dart';
import 'package:paywall/models/wallet/wallet_deposit_request.dart';
import 'package:paywall/models/wallet/wallet_deposit_response.dart';
import 'package:paywall/models/wallet/wallet_freeze_request.dart';
import 'package:paywall/models/wallet/wallet_list_response.dart';
import 'package:paywall/models/wallet/wallet_purchase_by_alias_request.dart';
import 'package:paywall/models/wallet/wallet_purchase_cancel_request.dart';
import 'package:paywall/models/wallet/wallet_purchase_refund_request.dart';
import 'package:paywall/models/wallet/wallet_purchase_request.dart';
import 'package:paywall/models/wallet/wallet_transaction_list_response.dart';
import 'package:paywall/models/wallet/wallet_transaction_response.dart';
import 'package:paywall/models/wallet/wallet_transfer_by_alias_request.dart';
import 'package:paywall/models/wallet/wallet_transfer_by_wallet_to_alias_request.dart';
import 'package:paywall/models/wallet/wallet_transfer_request.dart';
import 'package:paywall/models/wallet/wallet_transfer_response.dart';
import 'package:paywall/models/wallet/wallet_update_request.dart';
import 'package:paywall/models/wallet/wallet_withdraw_by_alias_request.dart';
import 'package:paywall/models/wallet/wallet_withdraw_request.dart';

import '../../models/base_response.dart';
import '../../models/wallet/wallet_detail_response.dart';
import '../../utils/api_constants.dart';
import '../base_service.dart';

/// Service responsible for wallet related API calls
/// Hint: Handles detail, list, and possible future wallet operations.
class WalletService extends BaseService {
  /// Fetches wallet detail by wallet ID
  /// Hint: Calls GET /v1/wallet/by/id/{id}
  Future<BaseResponse<WalletDetailResponseData>> getWalletById(String id) async {
    final response = await get("${ApiConstants.baseUrl}/v1/wallet/by/id/$id", fromJsonT: (json) => WalletDetailResponseData.fromJson(json), requiresAuth: true);
    return response;
  }
  /// Fetches wallet detail by alias
  /// Hint: Calls GET /v1/wallet/by/alias/{alias}
  Future<BaseResponse<WalletDetailResponseData>> getWalletByAlias(String alias) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/by/alias/$alias",
      fromJsonT: (json) => WalletDetailResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Fetches wallets by wallet owner ID with pagination
  /// Hint: Calls GET /v1/wallet/by/walletowner/{walletOwnerId}
  Future<BaseResponse<WalletListData>> getWalletsByOwnerId(String walletOwnerId, {required int pageNumber, required int pageSize}) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/by/walletowner/$walletOwnerId",
      queryParameters: {"PageNumber": pageNumber, "PageSize": pageSize},
      fromJsonT: (json) => WalletListData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Creates a new wallet
  /// Hint: Calls POST /v1/wallet
  Future<BaseResponse<WalletDetailResponseData>> createWallet(WalletCreateRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet",
      data: request.toJson(),
      fromJsonT: (json) => WalletDetailResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Updates an existing wallet
  /// Hint: Calls PUT /v1/wallet
  Future<BaseResponse<WalletDetailResponseData>> updateWallet(WalletUpdateRequest request) async {
    final response = await put(
      "${ApiConstants.baseUrl}/v1/wallet",
      data: request.toJson(),
      fromJsonT: (json) => WalletDetailResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Deletes a wallet by ID
  /// Hint: Calls DELETE /v1/wallet
  Future<BaseResponse<void>> deleteWallet(String id) async {
    final response = await delete("${ApiConstants.baseUrl}/v1/wallet", data: {"Id": id}, requiresAuth: true);
    return response;
  }

  /// Freezes a wallet until a given date or indefinitely
  /// Hint: Calls POST /v1/wallet/freeze
  Future<BaseResponse<WalletDetailResponseData>> freezeWallet(WalletFreezeRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/freeze",
      data: request.toJson(),
      fromJsonT: (json) => WalletDetailResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Unfreezes a wallet (removes freeze state)
  /// Hint: Calls POST /v1/wallet/unfreeze
  Future<BaseResponse<WalletDetailResponseData>> unfreezeWallet(String id) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/unfreeze",
      data: {"Id": id},
      fromJsonT: (json) => WalletDetailResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Deposits money into a wallet
  /// Hint: Calls POST /v1/wallet/deposit
  Future<BaseResponse<WalletDepositResponseData>> depositToWallet(WalletDepositRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/deposit",
      data: request.toJson(),
      fromJsonT: (json) => WalletDepositResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Deposits money into a wallet using alias
  /// Hint: Calls POST /v1/wallet/deposit/by/alias
  Future<BaseResponse<WalletDepositResponseData>> depositToWalletByAlias(WalletDepositByAliasRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/deposit/by/alias",
      data: request.toJson(),
      fromJsonT: (json) => WalletDepositResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Withdraws money from a wallet using wallet ID
  /// Hint: Calls POST /v1/wallet/withdraw
  Future<BaseResponse<WalletDepositResponseData>> withdrawFromWallet(WalletWithdrawRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/withdraw",
      data: request.toJson(),
      fromJsonT: (json) => WalletDepositResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Withdraws money from a wallet using alias
  /// Hint: Calls POST /v1/wallet/withdraw/by/alias
  Future<BaseResponse<WalletDepositResponseData>> withdrawFromWalletByAlias(WalletWithdrawByAliasRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/withdraw/by/alias",
      data: request.toJson(),
      fromJsonT: (json) => WalletDepositResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Transfers money from one wallet to another by wallet IDs
  /// Hint: Calls POST /v1/wallet/transfer
  Future<BaseResponse<WalletTransferResponseData>> transferBetweenWallets(WalletTransferRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/transfer",
      data: request.toJson(),
      fromJsonT: (json) => WalletTransferResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Transfers money from one wallet to another using alias
  /// Hint: Calls POST /v1/wallet/transfer/by/alias
  Future<BaseResponse<WalletTransferResponseData>> transferBetweenWalletsByAlias(WalletTransferByAliasRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/transfer/by/alias",
      data: request.toJson(),
      fromJsonT: (json) => WalletTransferResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Transfers money from a wallet (by ID) to another wallet (by alias)
  /// Hint: Calls POST /v1/wallet/transfer/by/wallet/to/alias
  Future<BaseResponse<WalletTransferResponseData>> transferFromWalletToAlias(WalletTransferByWalletToAliasRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/transfer/by/wallet/to/alias",
      data: request.toJson(),
      fromJsonT: (json) => WalletTransferResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Fetches wallet balance by wallet ID
  /// Hint: Calls GET /v1/wallet/balance/by/id/{id}
  Future<BaseResponse<WalletBalanceResponseData>> getWalletBalanceById(String walletId) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/balance/by/id/$walletId",
      fromJsonT: (json) => WalletBalanceResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Fetches wallet balance by wallet alias
  /// Hint: Calls GET /v1/wallet/balance/by/alias/{alias}
  Future<BaseResponse<WalletBalanceResponseData>> getWalletBalanceByAlias(String alias) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/balance/by/alias/$alias",
      fromJsonT: (json) => WalletBalanceResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Performs a purchase (spending) from a wallet using wallet ID
  /// Hint: Calls POST /v1/wallet/purchase
  Future<BaseResponse<WalletDepositResponseData>> purchaseFromWallet(WalletPurchaseRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/purchase",
      data: request.toJson(),
      fromJsonT: (json) => WalletDepositResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Performs a purchase (spending) from a wallet using alias
  /// Hint: Calls POST /v1/wallet/purchase/by/alias
  Future<BaseResponse<WalletDepositResponseData>> purchaseFromWalletByAlias(WalletPurchaseByAliasRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/purchase/by/alias",
      data: request.toJson(),
      fromJsonT: (json) => WalletDepositResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Cancels a purchase (spending) transaction
  /// Hint: Calls POST /v1/wallet/purchase/cancel
  Future<BaseResponse<WalletDepositResponseData>> cancelPurchase(WalletPurchaseCancelRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/purchase/cancel",
      data: request.toJson(),
      fromJsonT: (json) => WalletDepositResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Refunds a purchase (spending) transaction
  /// Hint: Calls POST /v1/wallet/purchase/refund
  Future<BaseResponse<WalletDepositResponseData>> refundPurchase(WalletPurchaseRefundRequest request) async {
    final response = await post(
      "${ApiConstants.baseUrl}/v1/wallet/purchase/refund",
      data: request.toJson(),
      fromJsonT: (json) => WalletDepositResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Checks if a payment is available for a given wallet and amount
  /// Hint: Calls GET /v1/wallet/check-payment-availability
  Future<BaseResponse<WalletCheckPaymentAvailabilityResponseData>> checkPaymentAvailability({required String walletId, required double amount}) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/check-payment-availability?WalletId=$walletId&Amount=$amount",
      fromJsonT: (json) => WalletCheckPaymentAvailabilityResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Checks if a payment is available for a given wallet alias and amount
  /// Hint: Calls GET /v1/wallet/check-payment-availability/by/alias
  Future<BaseResponse<WalletCheckPaymentAvailabilityResponseData>> checkPaymentAvailabilityByAlias({required String alias, required double amount}) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/check-payment-availability/by/alias?Alias=$alias&Amount=$amount",
      fromJsonT: (json) => WalletCheckPaymentAvailabilityResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Fetches a wallet transaction by transaction Id
  /// Hint: Calls GET /v1/wallet/transaction/by/id/:id
  Future<BaseResponse<WalletTransactionResponseData>> getWalletTransactionById(String transactionId) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/transaction/by/id/$transactionId",
      fromJsonT: (json) => WalletTransactionResponseData.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Fetches wallet transactions by WalletId with optional filters
  /// Hint: Calls GET /v1/wallet/transaction/by/wallet/:walletId
  Future<BaseResponse<WalletTransactionListResponse>> getWalletTransactionsByWalletId(
    String walletId, {
    int page = 1,
    int pageSize = 10,
    DateTime? startDate,
    DateTime? endDate,
    int? transactionType,
  }) async {
    final queryParams = {
      "Page": page.toString(),
      "PageSize": pageSize.toString(),
      if (startDate != null) "StartDate": startDate.toIso8601String(),
      if (endDate != null) "EndDate": endDate.toIso8601String(),
      if (transactionType != null) "TransactionType": transactionType.toString(),
    };

    final queryString = Uri(queryParameters: queryParams).query;

    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/transaction/by/wallet/$walletId?$queryString",
      fromJsonT: (json) => WalletTransactionListResponse.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Fetches wallet transactions by WalletOwnerId with optional filters
  /// Hint: Calls GET /v1/wallet/transaction/by/walletowner/:walletOwnerId
  Future<BaseResponse<WalletTransactionListResponse>> getWalletTransactionsByWalletOwnerId(
    String walletOwnerId, {
    int page = 1,
    int pageSize = 10,
    DateTime? startDate,
    DateTime? endDate,
    int? transactionType,
  }) async {
    final queryParams = {
      "Page": page.toString(),
      "PageSize": pageSize.toString(),
      if (startDate != null) "StartDate": startDate.toIso8601String(),
      if (endDate != null) "EndDate": endDate.toIso8601String(),
      if (transactionType != null) "TransactionType": transactionType.toString(),
    };

    final queryString = Uri(queryParameters: queryParams).query;

    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/transaction/by/walletowner/$walletOwnerId?$queryString",
      fromJsonT: (json) => WalletTransactionListResponse.fromJson(json),
      requiresAuth: true,
    );
    return response;
  }
  /// Fetches wallet transactions by ExternalReference
  /// Hint: Calls GET /v1/wallet/transaction/by/external-reference/:reference
  Future<BaseResponse<List<WalletTransactionResponseData>>> getWalletTransactionsByExternalReference(String externalReference) async {
    final response = await get(
      "${ApiConstants.baseUrl}/v1/wallet/transaction/by/external-reference/$externalReference",
      fromJsonT: (json) => (json as List).map((e) => WalletTransactionResponseData.fromJson(e)).toList(),
      requiresAuth: true,
    );
    return response;
  }
  /// Updates the description of a transaction
  /// Hint: Calls PUT /v1/wallet/transaction/description
  Future<BaseResponse<List<WalletTransactionResponseData>>> updateTransactionDescription(UpdateTransactionDescriptionRequest request) async {
    final response = await put(
      "${ApiConstants.baseUrl}/v1/wallet/transaction/description",
      data: request.toJson(),
      fromJsonT: (json) => (json as List).map((e) => WalletTransactionResponseData.fromJson(e)).toList(),
      requiresAuth: true,
    );
    return response;
  }
  /// Deletes limit record by wallet.
  /// Hint: Calls DELETE /v1/limit/by/wallet
  Future<BaseResponse<bool>> deleteLimitByWallet({required String walletId}) {
    return delete<bool>(
      '${ApiConstants.baseUrl}/v1/limit/by/wallet',
      data: {"WalletId": walletId},
      requiresAuth: true,
      fromJsonT: (dynamic json) => (json as bool?) ?? false,
    );
  }
}
