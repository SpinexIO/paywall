/// Request model for deleting a connection.
class ConnectionDeleteRequest {
  final String id;

  ConnectionDeleteRequest({required this.id});

  Map<String, dynamic> toJson() {
    return {"Id": id};
  }
}

/// Response model for delete connection operation.
/// Structure is same as create/update connection response.
class ConnectionDeleteResponse {
  final bool status;
  final bool failed;
  final bool succeeded;
  final String? message;
  final String? clientMessage;
  final int? errorCode;

  ConnectionDeleteResponse({required this.status, required this.failed, required this.succeeded, this.message, this.clientMessage, this.errorCode});

  factory ConnectionDeleteResponse.fromJson(Map<String, dynamic> json) {
    return ConnectionDeleteResponse(
      status: (json['result'] as Map<String, dynamic>)['status'] as bool,
      failed: json['failed'] as bool,
      succeeded: json['succeeded'] as bool,
      message: json['message'] as String?,
      clientMessage: json['clientMessage'] as String?,
      errorCode: json['errorCode'] as int?,
    );
  }
}
