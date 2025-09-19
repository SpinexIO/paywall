import 'package:paywall/models/base_response.dart';
import 'package:paywall/models/marketplace/debt/debt_update_request.dart';
import 'package:paywall/models/marketplace/debt/product_debt_response.dart';
import 'package:paywall/models/marketplace/earning/earning_by_id_response.dart';
import 'package:paywall/models/marketplace/earning/earning_by_member_request.dart';
import 'package:paywall/models/marketplace/earning/earning_by_member_response.dart';
import 'package:paywall/models/marketplace/earning/earning_decrease_by_id_request.dart';
import 'package:paywall/models/marketplace/earning/earning_increase_by_id_request.dart';
import 'package:paywall/models/marketplace/earning/earning_postpone_by_id_request.dart';
import 'package:paywall/models/marketplace/earning/earning_reflection_by_id_request.dart';
import 'package:paywall/models/marketplace/earning/earning_retry_by_id_request.dart';
import 'package:paywall/models/marketplace/earning/payment_earning_retry_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_decrease_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_increase_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_postpone_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_reflection_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_retry_request.dart';
import 'package:paywall/models/marketplace/manual/manual_trigger_inquiry_response.dart';
import 'package:paywall/models/marketplace/manual/manual_trigger_pending_response.dart';
import 'package:paywall/models/marketplace/manual/manual_trigger_restart_request.dart';
import 'package:paywall/models/marketplace/manual/manual_trigger_restart_response.dart';
import 'package:paywall/models/marketplace/manual/manual_trigger_start_request.dart';
import 'package:paywall/models/marketplace/manual/manual_trigger_start_response.dart';
import 'package:paywall/models/marketplace/payment/payment_approve_request.dart';
import 'package:paywall/models/marketplace/payment/payment_approve_response.dart';
import 'package:paywall/models/marketplace/payment/payment_reject_request.dart';
import 'package:paywall/models/marketplace/payment/payment_reject_response.dart';
import 'package:paywall/models/marketplace/product/product_approve_request.dart';
import 'package:paywall/models/marketplace/product/product_approve_response.dart';
import 'package:paywall/models/marketplace/product/product_reject_request.dart';
import 'package:paywall/models/marketplace/product/product_reject_response.dart';
import 'package:paywall/models/marketplace/report/approval_report_response.dart';
import 'package:paywall/models/marketplace/report/payment_earning_response.dart';
import 'package:paywall/models/marketplace/report/product_earning_response.dart';
import 'package:paywall/models/marketplace/self_payment/self_payment_approve_request.dart';
import 'package:paywall/models/marketplace/self_payment/self_payment_approve_response.dart';
import 'package:paywall/models/marketplace/self_payment/self_product_approve_request.dart';
import 'package:paywall/models/marketplace/self_payment/self_product_approve_response.dart';
import 'package:paywall/services/base_service.dart';
import 'package:paywall/utils/api_constants.dart';

class MarketPlace extends BaseService {
  /// Approves payments based on product IDs.
  /// Requires public API authentication headers.
  Future<BaseResponse<ProductApproveResponse>> approveProductPayment({
    required ProductApproveRequest request,
    
    
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/approve/pw/product",
      data: request.toJson(),
      fromJsonT: (json) => ProductApproveResponse.fromJson(json),
      requiresAuth: true,
    );

    return response;
  }

  /// Approves an entire payment based on its PaymentId.
  /// Requires public API authentication headers.
  Future<BaseResponse<PaymentApproveResponse>> approvePayment({
    required PaymentApproveRequest request,
    
    
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/approve/pw/payment",
      data: request.toJson(),
      fromJsonT: (json) => PaymentApproveResponse.fromJson(json),
      requiresAuth: true,
    );

    return response;
  }

  /// Approves products of a payment by their product IDs (self-approval).
  /// Requires public API authentication headers.
  Future<BaseResponse<SelfProductApproveResponse>> approveSelfProduct({
    required SelfProductApproveRequest request,
    
    
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/approve/self/product",
      data: request.toJson(),
      fromJsonT: (json) => SelfProductApproveResponse.fromJson(json),
      requiresAuth: true,
    );

    return response;
  }
  /// Approves a payment and its related products (self-approval).
  /// Requires public API authentication headers.
  Future<BaseResponse<SelfPaymentApproveResponse>> approveSelfPayment({
    required SelfPaymentApproveRequest request,
    
    
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/approve/self/payment",
      data: request.toJson(),
      fromJsonT: (json) => SelfPaymentApproveResponse.fromJson(json),
      requiresAuth: true,
    );

    return response;
  }
  /// Rejects specific products in a payment.
  /// Requires public API authentication headers.
  Future<BaseResponse<ProductRejectResponse>> rejectProducts({
    required ProductRejectRequest request,
    
    
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/reject/product",
      data: request.toJson(),
      fromJsonT: (json) => ProductRejectResponse.fromJson(json),
      requiresAuth: true,
    );

    return response;
  }

  /// Rejects a full payment by its PaymentId.
  /// Requires public API authentication headers.
  Future<BaseResponse<PaymentRejectResponse>> rejectPayment({
    required PaymentRejectRequest request,
    
    
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/reject/payment",
      data: request.toJson(),
      fromJsonT: (json) => PaymentRejectResponse.fromJson(json),
      requiresAuth: true,
    );

    return response;
  }
  /// Retrieves approval status of products in a payment.
  /// Requires public API authentication headers.
  Future<BaseResponse<ApprovalReportResponse>> getApprovalReport({
    required int paymentId,
    
    
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/approval",
      fromJsonT: (json) => ApprovalReportResponse.fromJson(json),
      requiresAuth: true,
      headers: {'paymentid': paymentId.toString()},
    );

    return response;
  }

  /// Retrieves product-based earning report.
  /// Requires public API authentication headers.
  Future<BaseResponse<ProductEarningResponse>> getProductEarning({
    required int productId,
    
    
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/earning/product",
      fromJsonT: (json) => ProductEarningResponse.fromJson(json),
      requiresAuth: true,
      headers: {'productid': productId.toString()},
    );

    return response;
  }

  /// Postpones the earning of a specific product.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> postponeProductEarning({
    required ProductEarningPostponeRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/postpone/product",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body: null dönüyor
      requiresAuth: true,
    );

    return response;
  }
  /// Increases the earning of a specific product.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> increaseProductEarning({
    required ProductEarningIncreaseRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/increase/product",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }
  /// Decreases the earning of a specific product.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> decreaseProductEarning({
    required ProductEarningDecreaseRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/decrease/product",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }
  /// Updates the reflection date of a specific product earning.
  Future<BaseResponse<void>> updateProductEarningReflection({
    required ProductEarningReflectionRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/reflection/product",
      data: request.toJson(),
      fromJsonT: (json) => null,
      requiresAuth: true,
    );
    return response;
  }
  /// Retries a product earning transaction.
  /// Optionally allows updating the reflection date.
  Future<BaseResponse<void>> retryProductEarning({
    required ProductEarningRetryRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/put/retry/product",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );
    return response;
  }
  /// Fetches earnings information for a given payment.
  /// Requires public API authentication headers.
  Future<BaseResponse<List<PaymentEarningResponse>>> getPaymentEarnings({
    required int paymentId,
    
    
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/earning/payment",
      fromJsonT: (json) => (json as List).map((item) => PaymentEarningResponse.fromJson(item)).toList(),
      requiresAuth: true,
      headers: {'paymentid': paymentId.toString()},
    );

    return response;
  }
  /// Retries a payment earning transaction.
  /// Optionally allows updating the reflection date.
  Future<BaseResponse<Null>> retryPaymentEarning({
    required PaymentEarningRetryRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/put/retry/payment",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }
  /// Retrieves earning details by earning Id.
  /// Requires public API authentication headers.
  Future<BaseResponse<EarningByIdResponse>> getEarningById({required int earningId}) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/earning/id",
      fromJsonT: (json) => EarningByIdResponse.fromJson(json),
      requiresAuth: true,
      headers: {'earningid': earningId.toString()},
    );

    return response;
  }

  /// Postpones an earning by its Id.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> postponeEarningById({
    required EarningPostponeByIdRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/postpone/id",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }

  /// Increases an earning by its Id.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> increaseEarningById({
    required EarningIncreaseByIdRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/increase/id",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }
  /// Decreases an earning by its Id.
  Future<BaseResponse<void>> decreaseEarningById({
    required EarningDecreaseByIdRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/decrease/id",
      data: request.toJson(),
      fromJsonT: (json) => null,
      requiresAuth: true,
    );

    return response;
  }

  /// Updates the reflection date of an earning by its Id.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> updateEarningReflectionById({
    required EarningReflectionByIdRequest request,
    
    
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/reflection/id",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }

  /// Retries an earning transaction by its Id.
  /// Optionally allows updating the reflection date.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> retryEarningById({required EarningRetryByIdRequest request}) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/put/retry/id",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }
  /// Retrieves earning records by member Id.
  /// Supports pagination, sorting, and optional date filtering.
  /// Requires public API authentication headers.
  Future<BaseResponse<EarningByMemberBody>> getEarningsByMember({
    required EarningByMemberRequest request,
    
    
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/earning/member",
      fromJsonT: (json) => EarningByMemberBody.fromJson(json),
      requiresAuth: true,
      headers: { ...request.toHeaders()},
    );

    return response;
  }

  /// Retrieves debt records for a given product.
  /// Requires public API authentication headers.
  Future<BaseResponse<List<ProductDebtResponse>>> getProductDebts({
    required int productId,
    
    
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/debt/product",
      fromJsonT: (json) => (json as List)
          .map((item) => ProductDebtResponse.fromJson(item))
          .toList(),
      requiresAuth: true,
      headers: {
        'productid': productId.toString(),
      },
    );

    return response;
  }
  /// Retrieves debt records for a given payment.
  /// Requires public API authentication headers.
  Future<BaseResponse<List<ProductDebtResponse>>> getPaymentDebts({
    required int paymentId,
    
    
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/debt/payment",
      fromJsonT: (json) => (json as List).map((item) => ProductDebtResponse.fromJson(item)).toList(),
      requiresAuth: true,
      headers: {'paymentid': paymentId.toString()},
    );

    return response;
  }
  /// Increases a debt amount by its Id.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> increaseDebt({required DebtUpdateRequest request}) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/debt/increase/id",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }  
  /// Decreases a debt amount by its Id.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> decreaseDebt({required DebtUpdateRequest request}) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/debt/decrease/id",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }
  /// Deletes a debt by its Id.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> deleteDebt({required int id}) async {
    final response = await delete(
      "${ApiConstants.baseUrl}/paywall/marketplace/debt/delete/id",
      data: {"Id": id},
      fromJsonT: (json) => null, // Body is always null
      requiresAuth: true,
    );

    return response;
  }
  /// Retrieves pending manual trigger earnings for a given date range and currency.
  /// Requires public API authentication headers.
  Future<BaseResponse<ManualTriggerPendingResponse>> getPendingManualTriggers({
    required DateTime dateFrom,
    required DateTime dateTo,
    required int currencyId,
    
    
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/manual/trigger/pending",
      fromJsonT: (json) => ManualTriggerPendingResponse.fromJson(json),
      requiresAuth: true,
      headers: {
        'datefrom': dateFrom.toIso8601String().split('T').first,
        'dateto': dateTo.toIso8601String().split('T').first,
        'currencyid': currencyId.toString(),
      },
    );

    return response;
  }
  /// Starts a manual trigger payment job.
  /// Requires public API authentication headers.
  Future<BaseResponse<ManualTriggerStartResponse>> startManualTrigger({
    required ManualTriggerStartRequest request,
    
    
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/manual/trigger/start",
      data: request.toJson(),
      fromJsonT: (json) => ManualTriggerStartResponse.fromJson(json),
      requiresAuth: true,
    );

    return response;
  }
  /// Inquires the status of a manual trigger payment job.
  /// Requires public API authentication headers.
  Future<BaseResponse<ManualTriggerInquiryResponse>> inquireManualTrigger({
    required String jobId,
    
    
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/manual/trigger/inquiry",
      fromJsonT: (json) => ManualTriggerInquiryResponse.fromJson(json),
      requiresAuth: true,
      headers: {'jobid': jobId},
    );

    return response;
  }
  /// Restarts a manual trigger payment job by JobId.
  /// Requires public API authentication headers.
  Future<BaseResponse<ManualTriggerRestartResponse>> restartManualTrigger({
    required ManualTriggerRestartRequest request,
    
    
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/manual/trigger/restart",
      data: request.toJson(),
      fromJsonT: (json) => ManualTriggerRestartResponse.fromJson(json),
      requiresAuth: true,
    );

    return response;
  }

}