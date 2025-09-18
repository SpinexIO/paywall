/// Request model for disconnecting (deactivating) a connection.
class ConnectionDisconnectRequest {
  final String id;

  ConnectionDisconnectRequest({required this.id});

  Map<String, dynamic> toJson() {
    return {"Id": id};
  }
}

/// Response model for disconnect connection operation.
/// Structure is same as create/update/delete connection response.
class ConnectionDisconnectResponse {
  final bool status;
  final bool failed;
  final bool succeeded;
  final String? message;
  final String? clientMessage;
  final int? errorCode;

  ConnectionDisconnectResponse({required this.status, required this.failed, required this.succeeded, this.message, this.clientMessage, this.errorCode});

  factory ConnectionDisconnectResponse.fromJson(Map<String, dynamic> json) {
    return ConnectionDisconnectResponse(
      status: (json['result'] as Map<String, dynamic>)['status'] as bool,
      failed: json['failed'] as bool,
      succeeded: json['succeeded'] as bool,
      message: json['message'] as String?,
      clientMessage: json['clientMessage'] as String?,
      errorCode: json['errorCode'] as int?,
    );
  }
}
