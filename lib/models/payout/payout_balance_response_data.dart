class PayoutBalanceItem {
  final double totalBalance;
  final double lockedBalance;
  final double availableBalance;

  PayoutBalanceItem({required this.totalBalance, required this.lockedBalance, required this.availableBalance});

  factory PayoutBalanceItem.fromJson(Map<String, dynamic> json) {
    return PayoutBalanceItem(
      totalBalance: (json["TotalBalance"] as num?)?.toDouble() ?? 0.0,
      lockedBalance: (json["LockedBalance"] as num?)?.toDouble() ?? 0.0,
      availableBalance: (json["AvailableBalance"] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"TotalBalance": totalBalance, "LockedBalance": lockedBalance, "AvailableBalance": availableBalance};
  }
}

class PayoutBalanceResponseData {
  final List<PayoutBalanceItem> balances;
  final String providerDump;
  final int providerHttpStatus;
  final int providerConnectedId;
  final int providerId;
  final String providerKey;
  final int currencyId;

  PayoutBalanceResponseData({
    required this.balances,
    required this.providerDump,
    required this.providerHttpStatus,
    required this.providerConnectedId,
    required this.providerId,
    required this.providerKey,
    required this.currencyId,
  });

  factory PayoutBalanceResponseData.fromJson(Map<String, dynamic> json) {
    final balancesJson = json["Balances"] as List<dynamic>? ?? [];
    return PayoutBalanceResponseData(
      balances: balancesJson.map((e) => PayoutBalanceItem.fromJson(e as Map<String, dynamic>)).toList(),
      providerDump: json["ProviderDump"] as String? ?? "",
      providerHttpStatus: (json["ProviderHttpStatus"] as num?)?.toInt() ?? 0,
      providerConnectedId: (json["ProviderConnectedId"] as num?)?.toInt() ?? 0,
      providerId: (json["ProviderId"] as num?)?.toInt() ?? 0,
      providerKey: json["ProviderKey"] as String? ?? "",
      currencyId: (json["CurrencyId"] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Balances": balances.map((e) => e.toJson()).toList(),
      "ProviderDump": providerDump,
      "ProviderHttpStatus": providerHttpStatus,
      "ProviderConnectedId": providerConnectedId,
      "ProviderId": providerId,
      "ProviderKey": providerKey,
      "CurrencyId": currencyId,
    };
  }
}
