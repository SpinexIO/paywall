class PayoutSendMemberRequest {
  final String payoutProviderKey;
  final String merchantUniqueCode;
  final int memberId;
  final String description;
  final double amount;
  final int currencyId;
  final String? merchantGroupCode;
  final bool? callbackSupport;
  final String? callbackAddress;

  PayoutSendMemberRequest({
    required this.payoutProviderKey,
    required this.merchantUniqueCode,
    required this.memberId,
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
      "MemberId": memberId,
      "Description": description,
      "Amount": amount,
      "CurrencyId": currencyId,
      if (merchantGroupCode != null) "MerchantGroupCode": merchantGroupCode,
      if (callbackSupport != null) "CallbackSupport": callbackSupport,
      if (callbackAddress != null) "CallbackAddress": callbackAddress,
    };
  }
}
