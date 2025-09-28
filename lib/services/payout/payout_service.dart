import 'package:paywall/models/payout/payout_query_request.dart';
import 'package:paywall/models/payout/payout_query_response_data.dart';
import 'package:paywall/models/payout/payout_send_account_request.dart';
import 'package:paywall/models/payout/payout_send_account_response_data.dart';
import 'package:paywall/models/payout/payout_send_iban_request.dart';
import 'package:paywall/models/payout/payout_send_iban_response_data.dart';
import 'package:paywall/models/payout/payout_send_member_request.dart';
import 'package:paywall/models/payout/payout_send_member_response_data.dart';
import 'package:paywall/utils/api_constants.dart';

import '../../models/base_response.dart';
import '../../models/payout/payout_balance_response_data.dart';
import '../../services/base_service.dart';

class PayoutService extends BaseService {

  /// Gets payout balance from provider.
  /// Hint: Calls GET /paywall/payout/balance
  Future<BaseResponse<PayoutBalanceResponseData>> getPayoutBalance({
    required String apikeyprivate,
    required String apiclientprivate,
    required int payoutconnectionid,
  }) {
    return get<PayoutBalanceResponseData>(
      '${ApiConstants.baseUrl}/paywall/payout/balance',
      headers: {'apikeyprivate': apikeyprivate, 'apiclientprivate': apiclientprivate, 'payoutconnectionid': payoutconnectionid.toString()},
      fromJsonT: (dynamic json) => PayoutBalanceResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Gets main account payout balance by currency.
  /// Hint: Calls GET /paywall/payout/balance/main
  Future<BaseResponse<PayoutBalanceResponseData>> getMainPayoutBalance({
    required String apikeyprivate,
    required String apiclientprivate,
    required int currencyid,
  }) {
    return get<PayoutBalanceResponseData>(
      '${ApiConstants.baseUrl}/paywall/payout/balance/main',
      headers: {'apikeyprivate': apikeyprivate, 'apiclientprivate': apiclientprivate, 'currencyid': currencyid.toString()},
      fromJsonT: (dynamic json) => PayoutBalanceResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Sends payout to IBAN.
  /// Hint: Calls POST /paywall/payout/send/iban
  Future<BaseResponse<PayoutSendIbanResponseData>> sendToIban({
    required String apikeyprivate,
    required String apiclientprivate,
    required PayoutSendIbanRequest request,
  }) {
    return post<PayoutSendIbanResponseData>(
      '${ApiConstants.baseUrl}/paywall/payout/send/iban',
      data: request.toJson(),
      headers: {'apikeyprivate': apikeyprivate, 'apiclientprivate': apiclientprivate},
      fromJsonT: (dynamic json) => PayoutSendIbanResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Sends payout to a registered member's IBAN.
  /// Hint: Calls POST /paywall/payout/send/member
  Future<BaseResponse<PayoutSendMemberResponseData>> sendToMember({
    required String apikeyprivate,
    required String apiclientprivate,
    required PayoutSendMemberRequest request,
  }) {
    return post<PayoutSendMemberResponseData>(
      '${ApiConstants.baseUrl}/paywall/payout/send/member',
      data: request.toJson(),
      headers: {'apikeyprivate': apikeyprivate, 'apiclientprivate': apiclientprivate},
      fromJsonT: (dynamic json) => PayoutSendMemberResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Sends payout to a bank account.
  /// Hint: Calls POST /paywall/payout/send/account
  Future<BaseResponse<PayoutSendAccountResponseData>> sendToAccount({
    required String apikeyprivate,
    required String apiclientprivate,
    required PayoutSendAccountRequest request,
  }) {
    return post<PayoutSendAccountResponseData>(
      '${ApiConstants.baseUrl}/paywall/payout/send/account',
      data: request.toJson(),
      headers: {'apikeyprivate': apikeyprivate, 'apiclientprivate': apiclientprivate},
      fromJsonT: (dynamic json) => PayoutSendAccountResponseData.fromJson(json as Map<String, dynamic>),
    );
  }
  /// Queries payout transaction by MerchantUniqueCode
  /// Hint: Calls GET /paywall/payout/query
  Future<BaseResponse<PayoutQueryResponseData>> queryTransaction({
    required String apikeyprivate,
    required String apiclientprivate,
    required PayoutQueryRequest request,
  }) {
    return get<PayoutQueryResponseData>(
      '${ApiConstants.baseUrl}/paywall/payout/query',
      queryParameters: request.toQueryParams(),
      headers: {'apikeyprivate': apikeyprivate, 'apiclientprivate': apiclientprivate},
      fromJsonT: (dynamic json) => PayoutQueryResponseData.fromJson(json as Map<String, dynamic>),
    );
  }

}
