import 'package:paywall/models/base_response.dart';
import 'package:paywall/models/payment/installment_response.dart';
import 'package:paywall/models/payment/payment_start3d_request.dart';
import 'package:paywall/models/payment/payment_start3d_response.dart';
import 'package:paywall/models/payment/payment_start_insurance_request.dart';
import 'package:paywall/models/payment/payment_start_insurance_response.dart';
import 'package:paywall/models/payment/payment_start_request.dart';
import 'package:paywall/models/payment/payment_start_response.dart';
import 'package:paywall/models/payment/provision_cancel_request.dart';
import 'package:paywall/models/payment/provision_cancel_response.dart';
import 'package:paywall/models/payment/provision_request.dart';
import 'package:paywall/models/payment/provision_response.dart';
import 'package:paywall/models/payment/refund_request.dart';
import 'package:paywall/services/base_service.dart';

import '../models/payment/bin_inquiry_response.dart';
import '../models/payment/version_response.dart';
import '../utils/api_constants.dart';

/// Service for handling Payment API operations.
class PaymentService extends BaseService {
  /// Retrieves the current version of the Payment API.
  /// Sends a GET request to the Payment Version API.
  Future<BaseResponse<VersionResponse>> getVersion() async {
    final response = await get("${ApiConstants.baseUrl}/paywall/payment/version", fromJsonT: (json) => VersionResponse.fromJson(json));

    return response;
  }

  /// Starts a direct (non-secure) payment.
  /// Sends a POST request to the Payment API with the given request body.
  Future<BaseResponse<PaymentStartResponse>> startDirectPayment({required PaymentStartRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/startdirect",
      data: request.toJson(),
      fromJsonT: (json) => PaymentStartResponse.fromJson(json),
    );

    return response;
  }
  /// Starts a direct (non-secure) insurance payment.
  /// Sends a POST request to the Payment Insurance API with the given request body.
  Future<BaseResponse<PaymentStartInsuranceResponse>> startDirectInsurancePayment({required PaymentStartInsuranceRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/startdirect/insurance",
      data: request.toJson(),
      fromJsonT: (json) => PaymentStartInsuranceResponse.fromJson(json),
    );

    return response;
  }
  /// Starts a 3D Secure payment.
  /// Sends a POST request to the Payment 3D API with the given request body.
  Future<BaseResponse<PaymentStart3DResponse>> start3DPayment({required PaymentStart3DRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/start3d",
      data: request.toJson(),
      fromJsonT: (json) => PaymentStart3DResponse.fromJson(json),
    );

    return response;
  }
  /// Closes a payment provision (provizyon kapatma).
  /// Sends a POST request to the Provision API with the given request body.
  Future<BaseResponse<ProvisionResponse>> closeProvision({required ProvisionRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/provision",
      data: request.toJson(),
      fromJsonT: (json) => ProvisionResponse.fromJson(json),
    );

    return response;
  }
  /// Cancels a payment provision (provizyon iptal).
  /// Sends a POST request to the Provision Cancel API with the given request body.
  Future<BaseResponse<ProvisionCancelResponse>> cancelProvision({required ProvisionCancelRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/provision/cancel",
      data: request.toJson(),
      fromJsonT: (json) => ProvisionCancelResponse.fromJson(json),
    );

    return response;
  }
  /// Queries available installment options.
  /// Sends a GET request to the Installment API.
  Future<BaseResponse<InstallmentResponse>> getInstallments({
    required int currencyId,
    required double amount,
    String? binNumber,
    required bool distinctDuplicates,
    int? endOfTheDay,
    int? posId,
  }) async {
    final queryParams = {
      "currencyid": currencyId.toString(),
      "amount": amount.toString(),
      if (binNumber != null) "binnumber": binNumber,
      "distinctduplicates": distinctDuplicates.toString(),
      if (endOfTheDay != null) "endoftheday": endOfTheDay.toString(),
      if (posId != null) "posid": posId.toString(),
    };

    final queryString = Uri(queryParameters: queryParams).query;

    final response = await get("${ApiConstants.baseUrl}/paywall/installment?$queryString", fromJsonT: (json) => InstallmentResponse.fromJson(json));

    return response;
  }
  /// Queries BIN information (supports both 6 and 8 digit BIN numbers).
  /// Sends a GET request to the BIN Inquiry API.
  Future<BaseResponse<BinInquiryResponse>> getBinInquiry({required String binNumber}) async {
    final response = await get("${ApiConstants.baseUrl}/paywall/bin/inquiry?binnumber=$binNumber", fromJsonT: (json) => BinInquiryResponse.fromJson(json));

    return response;
  }
  /// Sends a refund request for a payment.
  /// Requires private API authentication headers.
  Future<BaseResponse<dynamic>> refundPayment({required RefundRequest request, required String apiKeyPrivate, required String apiClientPrivate}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/private/refund",
      data: request.toJson(),
      fromJsonT: (json) => json, // Body null dönebileceği için generic json
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return response;
  }

}
