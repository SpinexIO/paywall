class PayoutQueryResponseData {
  final int payoutConnectionId;
  final String payoutProviderKey;
  final int payoutTransactionId;
  final int currencyId;
  final String merchantUniqueCode;
  final String uniqueCode;
  final double amount;
  final String description;
  final String receiverTitle;
  final String? receiverIban;
  final String? receiverAccountNumber;
  final int channelId;
  final String channel;
  final int statusId;
  final String status;
  final int typeId;
  final String type;
  final String ip;
  final DateTime dateTime;

  PayoutQueryResponseData({
    required this.payoutConnectionId,
    required this.payoutProviderKey,
    required this.payoutTransactionId,
    required this.currencyId,
    required this.merchantUniqueCode,
    required this.uniqueCode,
    required this.amount,
    required this.description,
    required this.receiverTitle,
    this.receiverIban,
    this.receiverAccountNumber,
    required this.channelId,
    required this.channel,
    required this.statusId,
    required this.status,
    required this.typeId,
    required this.type,
    required this.ip,
    required this.dateTime,
  });

  factory PayoutQueryResponseData.fromJson(Map<String, dynamic> json) {
    return PayoutQueryResponseData(
      payoutConnectionId: (json["PayoutConnectionId"] as num?)?.toInt() ?? 0,
      payoutProviderKey: json["PayoutProviderKey"] as String? ?? "",
      payoutTransactionId: (json["PayoutTransactionId"] as num?)?.toInt() ?? 0,
      currencyId: (json["CurrencyId"] as num?)?.toInt() ?? 0,
      merchantUniqueCode: json["MerchantUniqueCode"] as String? ?? "",
      uniqueCode: json["UniqueCode"] as String? ?? "",
      amount: (json["Amount"] as num?)?.toDouble() ?? 0.0,
      description: json["Description"] as String? ?? "",
      receiverTitle: json["ReceiverTitle"] as String? ?? "",
      receiverIban: json["ReceiverIban"] as String?,
      receiverAccountNumber: json["ReceiverAccountNumber"] as String?,
      channelId: (json["ChannelId"] as num?)?.toInt() ?? 0,
      channel: json["Channel"] as String? ?? "",
      statusId: (json["StatusId"] as num?)?.toInt() ?? 0,
      status: json["Status"] as String? ?? "",
      typeId: (json["TypeId"] as num?)?.toInt() ?? 0,
      type: json["Type"] as String? ?? "",
      ip: json["Ip"] as String? ?? "",
      dateTime: DateTime.tryParse(json["DateTime"] ?? "") ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "PayoutConnectionId": payoutConnectionId,
      "PayoutProviderKey": payoutProviderKey,
      "PayoutTransactionId": payoutTransactionId,
      "CurrencyId": currencyId,
      "MerchantUniqueCode": merchantUniqueCode,
      "UniqueCode": uniqueCode,
      "Amount": amount,
      "Description": description,
      "ReceiverTitle": receiverTitle,
      "ReceiverIban": receiverIban,
      "ReceiverAccountNumber": receiverAccountNumber,
      "ChannelId": channelId,
      "Channel": channel,
      "StatusId": statusId,
      "Status": status,
      "TypeId": typeId,
      "Type": type,
      "Ip": ip,
      "DateTime": dateTime.toIso8601String(),
    };
  }
}
