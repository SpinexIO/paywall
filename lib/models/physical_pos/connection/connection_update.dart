/// Request model for updating an existing connection.
class ConnectionUpdateRequest {
  final String id;
  final int brandId;
  final int providerId;
  final int regionId;
  final int endOfDayId;
  final String? displayName;
  final bool isProd;
  final bool isReporting;
  final bool isAsyncPayment;
  final bool isSocketPayment;
  final Map<String, String> serviceParameters;
  final String name;

  ConnectionUpdateRequest({
    required this.id,
    required this.brandId,
    required this.providerId,
    required this.regionId,
    required this.endOfDayId,
    this.displayName,
    required this.isProd,
    required this.isReporting,
    required this.isAsyncPayment,
    required this.isSocketPayment,
    required this.serviceParameters,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "BrandId": brandId,
      "ProviderId": providerId,
      "RegionId": regionId,
      "EndOfDayId": endOfDayId,
      if (displayName != null) "DisplayName": displayName,
      "IsProd": isProd,
      "IsReporting": isReporting,
      "IsAsyncPayment": isAsyncPayment,
      "IsSocketPayment": isSocketPayment,
      "ServiceParameters": serviceParameters,
      "Name": name,
    };
  }
}

/// Response model for update connection operation.
/// Structure is same as create connection response.
class ConnectionUpdateResponse {
  final bool status;
  final bool failed;
  final bool succeeded;
  final String? message;
  final String? clientMessage;
  final int? errorCode;

  ConnectionUpdateResponse({required this.status, required this.failed, required this.succeeded, this.message, this.clientMessage, this.errorCode});

  factory ConnectionUpdateResponse.fromJson(Map<String, dynamic> json) {
    return ConnectionUpdateResponse(
      status: (json['result'] as Map<String, dynamic>)['status'] as bool,
      failed: json['failed'] as bool,
      succeeded: json['succeeded'] as bool,
      message: json['message'] as String?,
      clientMessage: json['clientMessage'] as String?,
      errorCode: json['errorCode'] as int?,
    );
  }
}
