import 'package:dio/dio.dart';

import '../utils/api_constants.dart';
import '../utils/exceptions.dart';

/// A singleton API client that manages HTTP requests using [Dio].
///
/// This class handles:
/// - Base URL configuration
/// - Authentication headers (e.g., Bearer tokens)
/// - Interceptors for logging and error handling
class ApiClient {
  final Dio _dio;
  String? _token;
  String? _apiKeyPrivate;
  String? _apiClientPrivate;

  ApiClient._internal(this._dio);

  static final ApiClient _instance = ApiClient._internal(
    Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
      ),
    ),
  );

  factory ApiClient() => _instance;

  /// Sets the global authentication token.
  void setToken(String token) {
    _token = token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// Sets the global API key (private).
  void setApiKeyPrivate(String key) {
    _apiKeyPrivate = key;
    _dio.options.headers['apikeyprivate'] = key;
  }
  /// Sets the global API client (private).
  void setApiClientPrivate(String key) {
    _apiClientPrivate = key;
    _dio.options.headers['apiclientprivate'] = key;
  }

  /// Clears the global authentication token.
  void clearToken() {
    _token = null;
    _dio.options.headers.remove('Authorization');
  }

  /// Clears the global API key (private).
  void clearApiKeyPrivate() {
    _apiKeyPrivate = null;
    _dio.options.headers.remove('apikeyprivate');
  }
  /// Clears the global API client (private).
  void clearApiClientPrivate() {
    _apiClientPrivate = null;
    _dio.options.headers.remove('apiclientprivate');
  }
  /// Executes a GET request with optional query parameters and headers.
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// Executes a POST request with optional body and headers.
  Future<Response<T>> post<T>(String path, {dynamic data, Map<String, dynamic>? headers,}) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// Executes a PUT request with optional body and headers.
  Future<Response<T>> put<T>(String path, {dynamic data, Map<String, dynamic>? headers}) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// Executes a DELETE request with optional body and headers.
  Future<Response<T>> delete<T>(String path, {dynamic data, Map<String, dynamic>? headers}) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// Maps Dio errors to custom exceptions.
  ApiException _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
      return NetworkException(message: "Request timeout");
    }

    final response = e.response;
    final statusCode = response?.statusCode;

    switch (statusCode) {
      case 400:
        return BadRequestException(details: response?.data);
      case 401:
        return UnauthorizedException();
      case 404:
        return NotFoundException();
      case 500:
        return ServerException();
      default:
        return ApiException(statusCode: statusCode, message: e.message ?? "Unknown error", details: response?.data);
    }
  }
}
