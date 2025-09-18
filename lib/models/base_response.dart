/// A generic API response wrapper model.
///
/// Most API endpoints return a structured response containing
/// some form of status, message, and a data payload. This model
/// is designed to provide a reusable structure for parsing such
/// responses.
class BaseResponse<T> {
  /// Indicates whether the request was successful.
  final bool success;

  /// Optional human-readable message returned by the API.
  final String? message;

  /// The actual data payload returned by the API.
  /// This is generic so that each model can define its own type.
  final T? data;

  /// Creates a new [BaseResponse].
  BaseResponse({required this.success, this.message, this.data});

  /// Creates a [BaseResponse] from a JSON map.
  ///
  /// [fromJsonT] is a function that converts the nested JSON `data`
  /// into the corresponding model type `T`.
  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return BaseResponse<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  /// Converts this [BaseResponse] into a JSON map.
  ///
  /// [toJsonT] is a function that converts the model `T` into a JSON map.
  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {'success': success, 'message': message, 'data': data != null ? toJsonT(data as T) : null};
  }
}

