import 'package:paywall/client/api_client.dart';
import 'package:paywall/models/physical_pos/payment/async/payment_async_cancel_request.dart';
import 'package:paywall/models/physical_pos/payment/async/payment_async_cancel_response.dart';
import 'package:paywall/models/physical_pos/payment/async/payment_async_sale_request.dart';
import 'package:paywall/models/physical_pos/payment/async/payment_async_sale_response.dart';
import 'package:paywall/models/physical_pos/payment/payment_activities_request.dart';
import 'package:paywall/models/physical_pos/payment/payment_activities_response.dart';
import 'package:paywall/models/physical_pos/payment/payment_inquiry_response.dart';
import 'package:paywall/models/physical_pos/payment/payment_list_request.dart';
import 'package:paywall/models/physical_pos/payment/payment_list_response.dart';
import 'package:paywall/models/physical_pos/payment/payment_products_request.dart';
import 'package:paywall/models/physical_pos/payment/payment_products_response.dart';
import 'package:paywall/models/physical_pos/payment/sync/payment_sync_cancel_request.dart';
import 'package:paywall/models/physical_pos/payment/sync/payment_sync_cancel_response.dart';
import 'package:paywall/models/physical_pos/payment/sync/payment_sync_cancel_rollback_request.dart';
import 'package:paywall/models/physical_pos/payment/sync/payment_sync_cancel_rollback_response.dart';
import 'package:paywall/models/physical_pos/payment/sync/payment_sync_sale_request.dart';
import 'package:paywall/models/physical_pos/payment/sync/payment_sync_sale_response.dart';
import 'package:paywall/models/physical_pos/payment/sync/payment_sync_sale_rollback_request.dart';
import 'package:paywall/models/physical_pos/payment/sync/payment_sync_sale_rollback_response.dart';

class PaymentService {
  final ApiClient _apiClient = ApiClient();
  /// Creates an async payment sale request.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PaymentAsyncSaleResponse> createAsyncSale({
    required PaymentAsyncSaleRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    
    final response = await _apiClient.post(
      "/api/payment/async/sale",
      data: request.toJson(),
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    final result = (response.data as Map<String, dynamic>)['Result'] as Map<String, dynamic>;

    return PaymentAsyncSaleResponse.fromJson(result);
  }



  /// Sends an async cancel request to a terminal.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PaymentAsyncCancelResponse> cancelAsyncPayment({
    required PaymentAsyncCancelRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await _apiClient.post(
      "/api/payment/async/cancel",
      data: request.toJson(),
      headers: {
        'apikeyprivate': apiKeyPrivate,
        'apiclientprivate': apiClientPrivate,
      },
    );

    final result =
        (response.data as Map<String, dynamic>)['result'] as Map<String, dynamic>;

    return PaymentAsyncCancelResponse.fromJson(result);
  }


  /// Sends a sync sale request to a terminal.
  ///
  /// Requires `apikeyprivate` and `apiclientprivate` headers.
  Future<PaymentSyncSaleResponse> saleSyncPayment({
    required PaymentSyncSaleRequest request,
    required String apiKeyPrivate,
    required String apiClientPrivate,
  }) async {
    final response = await _apiClient.post(
      "/api/payment/sync/sale",
      data: request.toJson(),
      headers: {
        'apikeyprivate': apiKeyPrivate,
        'apiclientprivate': apiClientPrivate,
      },
    );

    final result =
        (response.data as Map<String, dynamic>)['Result'] as Map<String, dynamic>;

    return PaymentSyncSaleResponse.fromJson(result);
  }




/// Rolls back a previously sent sync sale request.
///
/// - Requires `apikeyprivate` and `apiclientprivate` headers.
/// - You cannot roll back within the first 5 seconds.
/// - The rollback is only possible if the terminal has **not yet received** the sale request.
Future<PaymentSyncSaleRollbackResponse> rollbackSyncSale({
  required PaymentSyncSaleRollbackRequest request,
  required String apiKeyPrivate,
  required String apiClientPrivate,
}) async {
  final response = await _apiClient.post(
    "/api/payment/sync/sale/rollback",
    data: request.toJson(),
    headers: {
      'apikeyprivate': apiKeyPrivate,
      'apiclientprivate': apiClientPrivate,
    },
  );

  return PaymentSyncSaleRollbackResponse.fromJson(
      response.data as Map<String, dynamic>);
}


/// Cancels a previously created sync payment request.
///
/// - Requires `apikeyprivate` and `apiclientprivate` headers.
/// - If the device is disconnected, you can use
///   `SendNotificationDeviceDisconnected = true`
///   to trigger push notification instead.
Future<PaymentSyncCancelResponse> cancelSyncPayment({
  required PaymentSyncCancelRequest request,
  required String apiKeyPrivate,
  required String apiClientPrivate,
}) async {
  final response = await _apiClient.post(
    "/api/payment/sync/cancel",
    data: request.toJson(),
    headers: {
      'apikeyprivate': apiKeyPrivate,
      'apiclientprivate': apiClientPrivate,
    },
  );

  return PaymentSyncCancelResponse.fromJson(
      response.data as Map<String, dynamic>);
}


/// Rolls back a previously sent Sync Cancel request.
/// 
/// - Only possible if the terminal has not yet received the cancel command.
/// - Cannot be done within the first 5 seconds after the cancel request.
/// - Requires `apikeyprivate` and `apiclientprivate` headers.
Future<PaymentSyncCancelRollbackResponse> rollbackSyncCancel({
  required PaymentSyncCancelRollbackRequest request,
  required String apiKeyPrivate,
  required String apiClientPrivate,
}) async {
  final response = await _apiClient.post(
    "/api/payment/sync/cancel/rollback",
    data: request.toJson(),
    headers: {
      'apikeyprivate': apiKeyPrivate,
      'apiclientprivate': apiClientPrivate,
    },
  );

  return PaymentSyncCancelRollbackResponse.fromJson(
      response.data as Map<String, dynamic>);
}


/// Fetches list of payments within date range with pagination.
///
/// Requires `apikeyprivate` and `apiclientprivate` headers.
Future<PaymentListResponse> getPayments({
  required PaymentListRequest request,
  required String apiKeyPrivate,
  required String apiClientPrivate,
}) async {
  final response = await _apiClient.post(
    "/api/payment/list",
    data: request.toJson(),
    headers: {
      'apikeyprivate': apiKeyPrivate,
      'apiclientprivate': apiClientPrivate,
    },
  );

  return PaymentListResponse.fromJson(response.data);
}


/// Fetches activities (steps/operations) of a given payment request.
///
/// Requires `apikeyprivate` and `apiclientprivate` headers.
Future<PaymentActivitiesResponse> getPaymentActivities({
  required PaymentActivitiesRequest request,
  required String apiKeyPrivate,
  required String apiClientPrivate,
}) async {
  final response = await _apiClient.post(
    "/api/payment/activities",
    data: request.toJson(),
    headers: {
      'apikeyprivate': apiKeyPrivate,
      'apiclientprivate': apiClientPrivate,
    },
  );

  return PaymentActivitiesResponse.fromJson(response.data);
}


/// Fetches products of a given payment request.
///
/// Requires `apikeyprivate` and `apiclientprivate` headers.
Future<PaymentProductsResponse> getPaymentProducts({
  required PaymentProductsRequest request,
  required String apiKeyPrivate,
  required String apiClientPrivate,
}) async {
  final response = await _apiClient.post(
    "/api/payment/products",
    data: request.toJson(),
    headers: {
      'apikeyprivate': apiKeyPrivate,
      'apiclientprivate': apiClientPrivate,
    },
  );

  return PaymentProductsResponse.fromJson(response.data);
}
Future<PaymentInquiryResponse> getPaymentInquiry({required String paymentRequestId, required String apiKeyPrivate, required String apiClientPrivate}) async {
    final response = await _apiClient.get(
      "/api/payment/inquiry/$paymentRequestId",
      headers: {'apikeyprivate': apiKeyPrivate, 'apiclientprivate': apiClientPrivate},
    );

    return PaymentInquiryResponse.fromJson(response.data);
  }

}