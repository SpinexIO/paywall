import 'dart:io';

import 'package:dio/dio.dart';
import 'package:paywall/models/base_response.dart';
import 'package:paywall/models/campaign/campaign_inquiry_request.dart';
import 'package:paywall/models/campaign/campaign_inquiry_response.dart';
import 'package:paywall/models/payment/bulk/batch_cancel_request.dart';
import 'package:paywall/models/payment/bulk/batch_cancel_response.dart';
import 'package:paywall/models/payment/bulk/bulk_cancel_request.dart';
import 'package:paywall/models/payment/bulk/bulk_cancel_response.dart';
import 'package:paywall/models/payment/bulk/bulk_payment_callback_request.dart';
import 'package:paywall/models/payment/bulk/bulk_payment_callback_response.dart';
import 'package:paywall/models/payment/bulk/bulk_payment_query_response.dart';
import 'package:paywall/models/payment/bulk/bulk_payment_retry_request.dart';
import 'package:paywall/models/payment/bulk/bulk_payment_retry_response.dart';
import 'package:paywall/models/payment/bulk/bulk_payment_summary_response.dart';
import 'package:paywall/models/payment/bulk/refund_batch_request.dart';
import 'package:paywall/models/payment/bulk/refund_batch_response.dart';
import 'package:paywall/models/payment/bulk/refund_bulk_request.dart';
import 'package:paywall/models/payment/bulk/refund_bulk_response.dart';
import 'package:paywall/models/payment/cancel/cancel_request.dart';
import 'package:paywall/models/payment/cancel/cancel_response.dart';
import 'package:paywall/models/payment/file/file_payment_response.dart';
import 'package:paywall/models/payment/installment/installment_response.dart';
import 'package:paywall/models/payment/provision/provision_cancel_request.dart';
import 'package:paywall/models/payment/provision/provision_cancel_response.dart';
import 'package:paywall/models/payment/provision/provision_request.dart';
import 'package:paywall/models/payment/provision/provision_response.dart';
import 'package:paywall/models/payment/query/payment_query_by_payment_id_request.dart';
import 'package:paywall/models/payment/query/payment_query_by_product_id_request.dart';
import 'package:paywall/models/payment/query/payment_query_by_tracking_code_request.dart';
import 'package:paywall/models/payment/query/payment_query_by_unique_code_request.dart';
import 'package:paywall/models/payment/query/payment_query_request.dart';
import 'package:paywall/models/payment/query/payment_query_response.dart';
import 'package:paywall/models/payment/refund/partial_refund_request.dart';
import 'package:paywall/models/payment/refund/refund_request.dart';
import 'package:paywall/models/payment/revert/revert_request.dart';
import 'package:paywall/models/payment/revert/revert_response.dart';
import 'package:paywall/models/payment/split/split_payment_request.dart';
import 'package:paywall/models/payment/split/split_payment_response.dart';
import 'package:paywall/models/payment/start/payment_start3d_request.dart';
import 'package:paywall/models/payment/start/payment_start3d_response.dart';
import 'package:paywall/models/payment/start/payment_start_insurance_request.dart';
import 'package:paywall/models/payment/start/payment_start_insurance_response.dart';
import 'package:paywall/models/payment/start/payment_start_request.dart';
import 'package:paywall/models/payment/start/payment_start_response.dart';
import 'package:paywall/models/payment/storm/storm_payment_request.dart';
import 'package:paywall/models/payment/storm/storm_payment_response.dart';
import 'package:paywall/models/payment/tsunami/tsunami_payment_response.dart';
import 'package:paywall/models/physical_pos/payment/payment_list_request.dart';
import 'package:paywall/models/physical_pos/payment/payment_list_response.dart';
import 'package:paywall/services/base_service.dart';

import '../../models/payment/bin/bin_inquiry_response.dart';
import '../../models/payment/version/version_response.dart';
import '../../utils/api_constants.dart';

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
  Future<BaseResponse<dynamic>> refundPayment({required RefundRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/private/refund",
      requiresAuth: true,
      data: request.toJson(),
      fromJsonT: (json) => json, // Body null dönebileceği için generic json
    );

    return response;
  }
  /// Sends a partial refund request for a payment.
  /// Requires private API authentication headers.
  Future<BaseResponse<dynamic>> partialRefundPayment({required PartialRefundRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/private/refund/partial",
      requiresAuth: true,
      data: request.toJson(),
      fromJsonT: (json) => json, // Body çoğunlukla null
    );

    return response;
  }
  /// Sends a cancel request for a payment.
  /// Requires private API authentication headers.
  Future<BaseResponse<CancelResponse>> cancelPayment({required CancelRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/private/cancel",
      requiresAuth: true,
      data: request.toJson(),
      fromJsonT: (json) => CancelResponse.fromJson(json),
    );

    return response;
  }

  /// Sends a revert request (cancel/refund/partial refund) for a payment.
  /// Requires private API authentication headers.
  Future<BaseResponse<RevertResponse>> revertPayment({required RevertRequest request}) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/private/revert",
      requiresAuth: true,
      data: request.toJson(),
      fromJsonT: (json) => RevertResponse.fromJson(json),
    );

    return response;
  }

  /// Retrieves payment details by MerchantUniqueCode.
  /// Requires private API authentication headers.
  Future<BaseResponse<PaymentQueryResponse>> getPaymentByMerchantUniqueCode({
    required PaymentQueryRequest request,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/private/query",
      fromJsonT: (json) => PaymentQueryResponse.fromJson(json),
      requiresAuth: true,
      headers: { ...request.toHeaders()},
    );

    return response;
  }
  /// Retrieves payment details by UniqueCode.
  /// Requires private API authentication headers.
  Future<BaseResponse<PaymentQueryResponse>> getPaymentByUniqueCode({
    required PaymentQueryByUniqueCodeRequest request,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/private/query/by/uniquecode",
      fromJsonT: (json) => PaymentQueryResponse.fromJson(json),
      requiresAuth: true,
      headers: { ...request.toHeaders()},
    );

    return response;
  }

    /// Retrieves payment details by PaymentId.
  /// Requires private API authentication headers.
  Future<BaseResponse<PaymentQueryResponse>> getPaymentByPaymentId({
    required PaymentQueryByPaymentIdRequest request,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/private/query/by/paymentid",
      fromJsonT: (json) => PaymentQueryResponse.fromJson(json),
      requiresAuth: true,
      headers: { ...request.toHeaders()},
    );

    return response;
  }

    /// Retrieves a list of payments associated with the given ProductId.
  /// Requires private API authentication headers.
  Future<BaseResponse<List<PaymentQueryResponse>>> getPaymentsByProductId({
    required PaymentQueryByProductIdRequest request,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/private/query/by/productid",
      fromJsonT: (json) => (json as List).map((e) => PaymentQueryResponse.fromJson(e)).toList(),
      requiresAuth: true,
      headers: { ...request.toHeaders()},
    );

    return response;
  }
  /// Retrieves a list of payments associated with the given TrackingCode.
  /// Requires private API authentication headers.
  Future<BaseResponse<List<PaymentQueryResponse>>> getPaymentsByTrackingCode({
    required PaymentQueryByTrackingCodeRequest request,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/private/query/by/trackingcode",
      fromJsonT: (json) => (json as List).map((e) => PaymentQueryResponse.fromJson(e)).toList(),
      requiresAuth: true,
      headers: { ...request.toHeaders()},
    );

    return response;
  }
  /// Starts a bulk (Storm) payment request.
  /// Requires public API authentication headers.
  Future<BaseResponse<StormPaymentResponse>> startStormPayment({
    required StormPaymentRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/startdirect",
      data: request.toJson(),
      fromJsonT: (json) => StormPaymentResponse.fromJson(json),
    );

    return response;
  }
  /// Starts a bulk (Tsunami) payment request.
  /// Requires public API authentication headers.
  Future<BaseResponse<TsunamiPaymentResponse>> startTsunamiPayment({
    required StormPaymentRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/big/startdirect",
      data: request.toJson(),
      fromJsonT: (json) => TsunamiPaymentResponse.fromJson(json),
      // Burada dilersen Content-Encoding: gzip / br header’ı da ekleyebilirsin.
    );

    return response;
  }
  /// Starts a bulk (File-based) payment request.
  /// Requires public API authentication headers.
  Future<BaseResponse<FilePaymentResponse>> startFilePayment({
    required File file,
    required int fileFormat,
    required int filePattern,
    required int currencyId,
    int? installment,
    String? callbackAddress,
    bool? half2D,
    double? amount,
    String? merchantUniqueCode,
    String? trackingCode,
    bool? callbackBodyCompression,
  }) async {
    final formData = FormData.fromMap({
      'FileFormat': fileFormat,
      'FilePattern': filePattern,
      'CurrencyId': currencyId,
      if (installment != null) 'Installment': installment,
      if (callbackAddress != null) 'CallbackAddress': callbackAddress,
      if (half2D != null) 'Half2D': half2D,
      if (amount != null) 'Amount': amount,
      if (merchantUniqueCode != null) 'MerchantUniqueCode': merchantUniqueCode,
      if (trackingCode != null) 'TrackingCode': trackingCode,
      if (callbackBodyCompression != null) 'CallbackBodyCompression': callbackBodyCompression,
      'File': await MultipartFile.fromFile(file.path, filename: file.uri.pathSegments.last),
    });

    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/file/startdirect",
      data: formData,
      fromJsonT: (json) => FilePaymentResponse.fromJson(json),
      requiresAuth: true,
      headers: {'Content-Type': 'multipart/form-data'},
    );

    return response;
  }
  /// Cancels a bulk payment by date and MerchantUniqueCode.
  /// Requires public API authentication headers.
  Future<BaseResponse<BulkCancelResponse>> cancelBulkPayment({
    required BulkCancelRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/payment/cancel",
      data: request.toJson(),
      fromJsonT: (json) => BulkCancelResponse.fromJson(json),
    );

    return response;
  }
  /// Cancels multiple payments (batch cancel).
  /// Requires public API authentication headers.
  Future<BaseResponse<BatchCancelResponse>> batchCancelPayments({
    required BatchCancelRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/batch/cancel",
      data: request.toJson(),
      fromJsonT: (json) => BatchCancelResponse.fromJson(json),
    );

    return response;
  }

  /// Refunds bulk payments.
  /// Requires public API authentication headers.
  Future<BaseResponse<RefundBulkResponse>> refundBulkPayment({
    required RefundBulkRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/payment/refund",
      data: request.toJson(),
      fromJsonT: (json) => RefundBulkResponse.fromJson(json),
    );

    return response;
  }
  /// Refunds a list of payments in batch.
  /// Requires public API authentication headers.
  Future<BaseResponse<RefundBatchResponse>> refundBatchPayments({
    required RefundBatchRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/batch/refund",
      data: request.toJson(),
      fromJsonT: (json) => RefundBatchResponse.fromJson(json),
    );

    return response;
  }
  /// Queries bulk payment results by merchant unique code.
  /// Supports pagination with pageSize and pageNumber.
  Future<BaseResponse<BulkPaymentQueryResponse>> queryBulkPayments({
    required String merchantUniqueCode,
    required int pageSize,
    required int pageNumber,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/payment/query",
      queryParameters: {'merchantuniquecode': merchantUniqueCode, 'pageSize': pageSize, 'pageNumber': pageNumber},
      fromJsonT: (json) => BulkPaymentQueryResponse.fromJson(json),
    );

    return response;
  }
  /// Queries bulk payment summary results by merchant unique code.
  Future<BaseResponse<BulkPaymentSummaryResponse>> queryBulkPaymentsSummary({
    required String merchantUniqueCode,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/payment/query/summary",
      queryParameters: {'merchantuniquecode': merchantUniqueCode},
      fromJsonT: (json) => BulkPaymentSummaryResponse.fromJson(json),
    );

    return response;
  }
  /// Retries a bulk payment by its merchant unique code and date.
  /// Requires public API authentication headers.
  Future<BaseResponse<BulkPaymentRetryResponse>> retryBulkPayment({
    required BulkPaymentRetryRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/payment/retry",
      data: request.toJson(),
      fromJsonT: (json) => BulkPaymentRetryResponse.fromJson(json),
    );

    return response;
  }
  /// Retries sending callback for a bulk payment within the last 7 days.
  /// Requires public API authentication headers.
  Future<BaseResponse<BulkPaymentCallbackResponse>> resendBulkPaymentCallback({
    required BulkPaymentCallbackRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/bulk/payment/send/callback",
      data: request.toJson(),
      fromJsonT: (json) => BulkPaymentCallbackResponse.fromJson(json),
    );

    return response;
  }

  /// Starts a split payment transaction.
  /// Requires public API authentication headers.
  Future<BaseResponse<SplitPaymentResponse>> startSplitPayment({
    required SplitPaymentRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/payment/start/split",
      data: request.toJson(),
      fromJsonT: (json) => SplitPaymentResponse.fromJson(json),
    );

    return response;
  }
  /// Lists completed payments from T-1 day.
  /// Requires private API authentication headers.
  Future<BaseResponse<PaymentListResponse>> getPayments({
    required PaymentListRequest request,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/private/vpos/transaction/list",
      queryParameters: request.toJson(),
      fromJsonT: (json) => PaymentListResponse.fromJson(json),
    );

    return response;
  }
  /// Inquires available campaigns for a given card and amount.
  /// Requires public API authentication headers.
  Future<BaseResponse<CampaignInquiryResponse>> inquireCampaigns({
    required CampaignInquiryRequest request,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/campaign/vpos/inquiry",
      data: request.toJson(),
      fromJsonT: (json) => CampaignInquiryResponse.fromJson(json),
    );

    return response;
  }
}
