import 'package:paywall/models/base_response.dart';
import 'package:paywall/models/marketplace/bank_account_add_request.dart';
import 'package:paywall/models/marketplace/bank_account_add_response.dart';
import 'package:paywall/models/marketplace/bank_account_delete_request.dart';
import 'package:paywall/models/marketplace/bank_account_delete_response.dart';
import 'package:paywall/models/marketplace/bank_account_list_response.dart';
import 'package:paywall/models/marketplace/bank_account_update_request.dart';
import 'package:paywall/models/marketplace/bank_account_update_response.dart';
import 'package:paywall/models/marketplace/member_create_request.dart';
import 'package:paywall/models/marketplace/member_create_response.dart';
import 'package:paywall/models/marketplace/member_delete_request.dart';
import 'package:paywall/models/marketplace/member_delete_response.dart';
import 'package:paywall/models/marketplace/member_list_response.dart';
import 'package:paywall/models/marketplace/member_search_response.dart';
import 'package:paywall/models/marketplace/member_update_request.dart';
import 'package:paywall/models/marketplace/member_update_response.dart';
import 'package:paywall/models/marketplace/value_date_add_request.dart';
import 'package:paywall/models/marketplace/value_date_add_response.dart';
import 'package:paywall/models/marketplace/value_date_get_response.dart';
import 'package:paywall/services/base_service.dart';

import '../utils/api_constants.dart';

/// Service for handling Member related API operations.
class MemberService extends BaseService {
  /// Creates a new member.
  /// Sends a POST request to the Member API with required headers and request body.
  Future<BaseResponse<MemberCreateResponse>> createMember({
    required MemberCreateRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/member",
      data: request.toJson(),
      fromJsonT: (json) => MemberCreateResponse.fromJson(json),
    );

    return response;
  }


  /// Updates an existing member.
  /// Sends a PUT request to the Member API with the given request body.
  Future<BaseResponse<MemberUpdateResponse>> updateMember({required MemberUpdateRequest request}) async {
    final response = await put("${ApiConstants.baseUrl}/paywall/member", data: request.toJson(), fromJsonT: (json) => MemberUpdateResponse.fromJson(json));

    return response;
  }

  /// Deletes an existing member.
  /// Sends a DELETE request to the Member API with the given request body.
  Future<BaseResponse<MemberDeleteResponse>> deleteMember({required MemberDeleteRequest request}) async {
    final response = await delete("${ApiConstants.baseUrl}/paywall/member", data: request.toJson(), fromJsonT: (json) => MemberDeleteResponse.fromJson(json));

    return response;
  }

  /// Retrieves list of members with pagination.
  /// Sends a GET request to the Member API.
  Future<BaseResponse<MemberListResponse>> getMembers({required int start, required int length}) async {
    final response = await get("${ApiConstants.baseUrl}/paywall/member?start=$start&length=$length", fromJsonT: (json) => MemberListResponse.fromJson(json));

    return response;
  }

  /// Searches for a member by Id or ExternalId.
  /// Sends a GET request to the Member Search API.
  Future<BaseResponse<MemberSearchResponse>> searchMember({int? memberId, String? memberExternalId}) async {
    final queryParams = <String, String>{};
    if (memberId != null) queryParams['memberid'] = memberId.toString();
    if (memberExternalId != null) {
      queryParams['memberexternalid'] = memberExternalId;
    }

    final queryString = queryParams.entries.map((e) => "${e.key}=${Uri.encodeComponent(e.value)}").join("&");

    final response = await get("${ApiConstants.baseUrl}/paywall/member/search?$queryString", fromJsonT: (json) => MemberSearchResponse.fromJson(json));

    return response;
  }
  /// Adds a new bank account method to a member.
  /// Sends a POST request to the Bank Account API with the given request body.
  Future<BaseResponse<BankAccountAddResponse>> addBankAccount({required BankAccountAddRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/member/bankaccount",
      data: request.toJson(),
      fromJsonT: (json) => BankAccountAddResponse.fromJson(json),
    );

    return response;
  }
  /// Updates an existing bank account method.
  /// Sends a PUT request to the Bank Account API with the given request body.
  Future<BaseResponse<BankAccountUpdateResponse>> updateBankAccount({required BankAccountUpdateRequest request}) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/member/bankaccount",
      data: request.toJson(),
      fromJsonT: (json) => BankAccountUpdateResponse.fromJson(json),
    );

    return response;
  }

  /// Deletes an existing bank account method.
  /// Sends a DELETE request to the Bank Account API with the given request body.
  Future<BaseResponse<BankAccountDeleteResponse>> deleteBankAccount({required BankAccountDeleteRequest request}) async {
    final response = await delete(
      "${ApiConstants.baseUrl}/paywall/member/bankaccount",
      data: request.toJson(),
      fromJsonT: (json) => BankAccountDeleteResponse.fromJson(json),
    );

    return response;
  }
  /// Retrieves the list of bank accounts for a given member.
  /// Sends a GET request to the Bank Account API.
  Future<BaseResponse<BankAccountListResponse>> getBankAccounts({required int memberId}) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/member/bankaccount?memberid=$memberId",
      fromJsonT: (json) => BankAccountListResponse.fromJson(json),
    );

    return response;
  }
  /// Retrieves the value date and commission settings of a member.
  /// Sends a GET request to the ValueDate API.
  Future<BaseResponse<ValueDateGetResponse>> getValueDate({required int memberId}) async {
    final response = await get("${ApiConstants.baseUrl}/paywall/member/valuedate?memberid=$memberId", fromJsonT: (json) => ValueDateGetResponse.fromJson(json));

    return response;
  }

  /// Adds or updates the value date and commission settings of a member.
  /// Sends a POST request to the ValueDate API with the given request body.
  Future<BaseResponse<ValueDateAddResponse>> addOrUpdateValueDate({required ValueDateAddRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/member/valuedate",
      data: request.toJson(),
      fromJsonT: (json) => ValueDateAddResponse.fromJson(json),
    );

    return response;
  }

}
