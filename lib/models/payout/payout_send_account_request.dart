class PayoutSendAccountRequest {
  final String payoutProviderKey;
  final String merchantUniqueCode;
  final String receiverTitle;
  final String receiverAccount;
  final String? receiverIdentity;
  final String description;
  final double amount;
  final int currencyId;
  final String? merchantGroupCode;
  final bool? callbackSupport;
  final String? callbackAddress;

  PayoutSendAccountRequest({
    required this.payoutProviderKey,
    required this.merchantUniqueCode,
    required this.receiverTitle,
    required this.receiverAccount,
    this.receiverIdentity,
    required this.description,
    required this.amount,
    required this.currencyId,
    this.merchantGroupCode,
    this.callbackSupport,
    this.callbackAddress,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "PayoutProviderKey": payoutProviderKey,
      "MerchantUniqueCode": merchantUniqueCode,
      "ReceiverTitle": receiverTitle,
      "ReceiverAccount": receiverAccount,
      if (receiverIdentity != null) "ReceiverIdentity": receiverIdentity,
      "Description": description,
      "Amount": amount,
      "CurrencyId": currencyId,
      if (merchantGroupCode != null) "MerchantGroupCode": merchantGroupCode,
      if (callbackSupport != null) "CallbackSupport": callbackSupport,
      if (callbackAddress != null) "CallbackAddress": callbackAddress,
    };
  }
}
