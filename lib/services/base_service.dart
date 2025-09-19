import 'package:dio/dio.dart';
import 'package:paywall/models/base_response.dart';

import '../client/api_client.dart';

/// A base service class that provides common request handling
/// functionality for all API services.
///
/// Each specific service (e.g., AuthService, SubscriptionService)
/// should extend this class.
abstract class BaseService {
  /// The API client instance used to make HTTP requests.
  final ApiClient apiClient = ApiClient();

  /// Executes a GET request and parses the response into [BaseResponse].
  ///
  /// [path] - API endpoint.
  /// [queryParameters] - optional query parameters.
  /// [fromJsonT] - function to parse the `data` field into type `T`.
  Future<BaseResponse<T>> get<T>(
    String path, 
    {Map<String, dynamic>? queryParameters, required T Function(Map<String, dynamic>) fromJsonT, Map<String, dynamic>? headers, bool requiresAuth = false }) async {
    final Response response = await apiClient.get(path, queryParameters: queryParameters, headers: headers, requiresAuth: requiresAuth);
    return BaseResponse<T>.fromJson(response.data as Map<String, dynamic>, fromJsonT);
  }

  /// Executes a POST request and parses the response into [BaseResponse].
  ///
  /// [path] - API endpoint.
  /// [data] - request body.
  /// [fromJsonT] - function to parse the `data` field into type `T`.
  Future<BaseResponse<T>> post<T>(String path, {dynamic data, required T Function(Map<String, dynamic>) fromJsonT, Map<String, dynamic>? headers,
    bool requiresAuth = false,
  }) async {
    final Response response = await apiClient.post(path, data: data, headers: headers, requiresAuth: requiresAuth);

    return BaseResponse<T>.fromJson(response.data as Map<String, dynamic>, fromJsonT);
  }

  /// Executes a PUT request and parses the response into [BaseResponse].
  Future<BaseResponse<T>> put<T>(String path, {dynamic data, required T Function(Map<String, dynamic>) fromJsonT, Map<String, dynamic>? headers,
    bool requiresAuth = false,
  }) async {
    final Response response = await apiClient.put(path, data: data, headers: headers, requiresAuth: requiresAuth);

    return BaseResponse<T>.fromJson(response.data as Map<String, dynamic>, fromJsonT);
  }

  /// Executes a DELETE request and parses the response into [BaseResponse].
  Future<BaseResponse<T>> delete<T>(String path, {dynamic data,  T Function(Map<String, dynamic>)? fromJsonT, Map<String, dynamic>? headers,
    bool requiresAuth = false,
  }) async {
    final Response response = await apiClient.delete(path, data: data, headers: headers, requiresAuth: requiresAuth);

    return BaseResponse<T>.fromJson(response.data as Map<String, dynamic>, fromJsonT ?? (json) => json as T);
  }
}
