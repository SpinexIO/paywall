import 'package:paywall/models/base_response.dart';
import 'package:paywall/models/marketplace/earning/payment_earning_retry_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_decrease_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_increase_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_postpone_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_reflection_request.dart';
import 'package:paywall/models/marketplace/earning/product_earning_retry_request.dart';
import 'package:paywall/models/marketplace/payment_approve_request.dart';
import 'package:paywall/models/marketplace/payment_approve_response.dart';
import 'package:paywall/models/marketplace/payment_reject_request.dart';
import 'package:paywall/models/marketplace/payment_reject_response.dart';
import 'package:paywall/models/marketplace/product_approve_request.dart';
import 'package:paywall/models/marketplace/product_approve_response.dart';
import 'package:paywall/models/marketplace/product_reject_request.dart';
import 'package:paywall/models/marketplace/product_reject_response.dart' show ProductRejectResponse;
import 'package:paywall/models/marketplace/report/approval_report_response.dart';
import 'package:paywall/models/marketplace/report/payment_earning_response.dart';
import 'package:paywall/models/marketplace/report/product_earning_response.dart';
import 'package:paywall/models/marketplace/self_payment_approve_request.dart';
import 'package:paywall/models/marketplace/self_payment_approve_response.dart';
import 'package:paywall/models/marketplace/self_product_approve_request.dart';
import 'package:paywall/models/marketplace/self_product_approve_response.dart';
import 'package:paywall/services/base_service.dart';
import 'package:paywall/utils/api_constants.dart';

class MarketPlace extends BaseService {
  /// Approves payments based on product IDs.
  /// Requires public API authentication headers.
  Future<BaseResponse<ProductApproveResponse>> approveProductPayment({
    required ProductApproveRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/approve/pw/product",
      data: request.toJson(),
      fromJsonT: (json) => ProductApproveResponse.fromJson(json),
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }

  /// Approves an entire payment based on its PaymentId.
  /// Requires public API authentication headers.
  Future<BaseResponse<PaymentApproveResponse>> approvePayment({
    required PaymentApproveRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/approve/pw/payment",
      data: request.toJson(),
      fromJsonT: (json) => PaymentApproveResponse.fromJson(json),
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }

  /// Approves products of a payment by their product IDs (self-approval).
  /// Requires public API authentication headers.
  Future<BaseResponse<SelfProductApproveResponse>> approveSelfProduct({
    required SelfProductApproveRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/approve/self/product",
      data: request.toJson(),
      fromJsonT: (json) => SelfProductApproveResponse.fromJson(json),
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }
  /// Approves a payment and its related products (self-approval).
  /// Requires public API authentication headers.
  Future<BaseResponse<SelfPaymentApproveResponse>> approveSelfPayment({
    required SelfPaymentApproveRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/approve/self/payment",
      data: request.toJson(),
      fromJsonT: (json) => SelfPaymentApproveResponse.fromJson(json),
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }
  /// Rejects specific products in a payment.
  /// Requires public API authentication headers.
  Future<BaseResponse<ProductRejectResponse>> rejectProducts({
    required ProductRejectRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/reject/product",
      data: request.toJson(),
      fromJsonT: (json) => ProductRejectResponse.fromJson(json),
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }

  /// Rejects a full payment by its PaymentId.
  /// Requires public API authentication headers.
  Future<BaseResponse<PaymentRejectResponse>> rejectPayment({
    required PaymentRejectRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await post(
      "${ApiConstants.baseUrl}/paywall/marketplace/reject/payment",
      data: request.toJson(),
      fromJsonT: (json) => PaymentRejectResponse.fromJson(json),
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }
  /// Retrieves approval status of products in a payment.
  /// Requires public API authentication headers.
  Future<BaseResponse<ApprovalReportResponse>> getApprovalReport({
    required int paymentId,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/approval",
      fromJsonT: (json) => ApprovalReportResponse.fromJson(json),
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic, 'paymentid': paymentId.toString()},
    );

    return response;
  }

  /// Retrieves product-based earning report.
  /// Requires public API authentication headers.
  Future<BaseResponse<ProductEarningResponse>> getProductEarning({
    required int productId,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/earning/product",
      fromJsonT: (json) => ProductEarningResponse.fromJson(json),
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic, 'productid': productId.toString()},
    );

    return response;
  }

  /// Postpones the earning of a specific product.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> postponeProductEarning({
    required ProductEarningPostponeRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/postpone/product",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body: null dönüyor
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }
  /// Increases the earning of a specific product.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> increaseProductEarning({
    required ProductEarningIncreaseRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/increase/product",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }
  /// Decreases the earning of a specific product.
  /// Requires public API authentication headers.
  Future<BaseResponse<void>> decreaseProductEarning({
    required ProductEarningDecreaseRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/decrease/product",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }
  /// Updates the reflection date of a specific product earning.
  Future<BaseResponse<void>> updateProductEarningReflection({
    required ProductEarningReflectionRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/reflection/product",
      data: request.toJson(),
      fromJsonT: (json) => null,
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );
    return response;
  }
  /// Retries a product earning transaction.
  /// Optionally allows updating the reflection date.
  Future<BaseResponse<void>> retryProductEarning({
    required ProductEarningRetryRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/put/retry/product",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );
    return response;
  }
  /// Fetches earnings information for a given payment.
  /// Requires public API authentication headers.
  Future<BaseResponse<List<PaymentEarningResponse>>> getPaymentEarnings({
    required int paymentId,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await get(
      "${ApiConstants.baseUrl}/paywall/marketplace/report/earning/payment",
      fromJsonT: (json) => (json as List).map((item) => PaymentEarningResponse.fromJson(item)).toList(),
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic, 'paymentid': paymentId.toString()},
    );

    return response;
  }
  /// Retries a payment earning transaction.
  /// Optionally allows updating the reflection date.
  Future<BaseResponse<Null>> retryPaymentEarning({
    required PaymentEarningRetryRequest request,
    required String apiKeyPublic,
    required String apiClientPublic,
  }) async {
    final response = await put(
      "${ApiConstants.baseUrl}/paywall/marketplace/earning/put/retry/payment",
      data: request.toJson(),
      fromJsonT: (json) => null, // Body is always null
      headers: {'apikeypublic': apiKeyPublic, 'apiclientpublic': apiClientPublic},
    );

    return response;
  }
}