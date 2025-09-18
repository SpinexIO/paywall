/// Request model for reconnecting a disconnected connection.
class ConnectionReconnectRequest {
  final String id;

  ConnectionReconnectRequest({required this.id});

  Map<String, dynamic> toJson() {
    return {"Id": id};
  }
}

/// Response model for reconnect connection operation.
/// Structure is same as disconnect/delete response.
class ConnectionReconnectResponse {
  final bool status;
  final bool failed;
  final bool succeeded;
  final String? message;
  final String? clientMessage;
  final int? errorCode;

  ConnectionReconnectResponse({required this.status, required this.failed, required this.succeeded, this.message, this.clientMessage, this.errorCode});

  factory ConnectionReconnectResponse.fromJson(Map<String, dynamic> json) {
    return ConnectionReconnectResponse(
      status: (json['result'] as Map<String, dynamic>)['status'] as bool,
      failed: json['failed'] as bool,
      succeeded: json['succeeded'] as bool,
      message: json['message'] as String?,
      clientMessage: json['clientMessage'] as String?,
      errorCode: json['errorCode'] as int?,
    );
  }
}
