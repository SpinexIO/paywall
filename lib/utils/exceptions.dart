/// Custom exception types for handling API-related errors.
class ApiException implements Exception {
  /// The HTTP status code returned from the server (if available).
  final int? statusCode;

  /// The error message describing what went wrong.
  final String message;

  /// Optional detailed information (e.g., API error body).
  final dynamic details;

  /// Creates a new [ApiException].
  ApiException({this.statusCode, required this.message, this.details});

  @override
  String toString() {
    return 'ApiException(statusCode: $statusCode, message: $message, details: $details)';
  }
}

/// Exception for cases where network connectivity fails
/// or the request cannot reach the server.
class NetworkException extends ApiException {
  NetworkException({String message = "Network error"}) : super(message: message);
}

/// Exception for cases where the request is invalid
/// (e.g., 400 Bad Request).
class BadRequestException extends ApiException {
  BadRequestException({String message = "Bad request", dynamic details}) : super(statusCode: 400, message: message, details: details);
}

/// Exception for cases where authentication fails
/// (e.g., 401 Unauthorized).
class UnauthorizedException extends ApiException {
  UnauthorizedException({String message = "Unauthorized"}) : super(statusCode: 401, message: message);
}

/// Exception for cases where the requested resource is not found
/// (e.g., 404 Not Found).
class NotFoundException extends ApiException {
  NotFoundException({String message = "Resource not found"}) : super(statusCode: 404, message: message);
}

/// Exception for cases where the server fails unexpectedly
/// (e.g., 500 Internal Server Error).
class ServerException extends ApiException {
  ServerException({String message = "Server error"}) : super(statusCode: 500, message: message);
}
