/// Represents the detailed information of a connection.
class ConnectionDetail {
  final String id;
  final String name;
  final String displayName;
  final int brandId;
  final int providerId;
  final int regionId;
  final int endOfDayId;
  final bool isReporting;
  final bool isAsyncPayment;
  final bool isSocketPayment;
  final bool isConnected;
  final bool isDelete;
  final bool isProd;

  /// Service parameters are returned as key-value pairs.
  final Map<String, String> serviceParameters;

  ConnectionDetail({
    required this.id,
    required this.name,
    required this.displayName,
    required this.brandId,
    required this.providerId,
    required this.regionId,
    required this.endOfDayId,
    required this.isReporting,
    required this.isAsyncPayment,
    required this.isSocketPayment,
    required this.isConnected,
    required this.isDelete,
    required this.isProd,
    required this.serviceParameters,
  });

  factory ConnectionDetail.fromJson(Map<String, dynamic> json) {
    return ConnectionDetail(
      id: json['Id'] as String,
      name: json['Name'] as String,
      displayName: json['DisplayName'] as String,
      brandId: json['BrandId'] as int,
      providerId: json['ProviderId'] as int,
      regionId: json['RegionId'] as int,
      endOfDayId: json['EndOfDayId'] as int,
      isReporting: json['IsReporting'] as bool,
      isAsyncPayment: json['IsAsyncPayment'] as bool,
      isSocketPayment: json['IsSocketPayment'] as bool,
      isConnected: json['IsConnected'] as bool,
      isDelete: json['IsDelete'] as bool,
      isProd: json['IsProd'] as bool,
      serviceParameters: (json['ServiceParameters'] as Map<String, dynamic>).map((key, value) => MapEntry(key, value as String)),
    );
  }
}

/// Top-level response for connection detail.
class ConnectionDetailResponse {
  final ConnectionDetail result;
  final int? errorCode;
  final bool succeeded;
  final bool failed;
  final String? message;
  final String? clientMessage;

  ConnectionDetailResponse({required this.result, this.errorCode, required this.succeeded, required this.failed, this.message, this.clientMessage});

  factory ConnectionDetailResponse.fromJson(Map<String, dynamic> json) {
    return ConnectionDetailResponse(
      result: ConnectionDetail.fromJson(json['Result']),
      errorCode: json['ErrorCode'] as int?,
      succeeded: json['Succeeded'] as bool,
      failed: json['Failed'] as bool,
      message: json['Message'] as String?,
      clientMessage: json['ClientMessage'] as String?,
    );
  }
}
