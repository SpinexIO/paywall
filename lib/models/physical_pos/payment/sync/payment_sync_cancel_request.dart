/// Request model for Sync Cancel
class PaymentSyncCancelRequest {
  final String paymentRequestId;
  final bool sendNotificationDeviceDisconnected;

  PaymentSyncCancelRequest({required this.paymentRequestId, this.sendNotificationDeviceDisconnected = false});

  Map<String, dynamic> toJson() => {'PaymentRequestId': paymentRequestId, 'SendNotificationDeviceDisconnected': sendNotificationDeviceDisconnected};

  factory PaymentSyncCancelRequest.fromJson(Map<String, dynamic> json) {
    return PaymentSyncCancelRequest(
      paymentRequestId: json['PaymentRequestId'],
      sendNotificationDeviceDisconnected: json['SendNotificationDeviceDisconnected'] ?? false,
    );
  }
}
