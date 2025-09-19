class WalletTransactionResponseData {
  final String id;
  final String walletId;
  final String? alias;
  final String transactionType;
  final double amount;
  final double? giftAmount;
  final String? description;
  final String? externalReference;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final double balanceAfterTransaction;
  final double? blockedBalanceAfterTransaction;
  final double? availableBalanceAfterTransaction;
  final double? giftBalanceBalanceAfterTransaction;
  final String currencyCode;
  final String? sourceWalletId;
  final String? destinationWalletId;
  final String? giftBalanceId;
  final String? mainTransactionId;
  final String uniqueCode;
  final List<dynamic>? usedGiftBalances;
  final double cashbackAmount;

  WalletTransactionResponseData({
    required this.id,
    required this.walletId,
    this.alias,
    required this.transactionType,
    required this.amount,
    this.giftAmount,
    this.description,
    this.externalReference,
    required this.createdAt,
    this.updatedAt,
    required this.balanceAfterTransaction,
    this.blockedBalanceAfterTransaction,
    this.availableBalanceAfterTransaction,
    this.giftBalanceBalanceAfterTransaction,
    required this.currencyCode,
    this.sourceWalletId,
    this.destinationWalletId,
    this.giftBalanceId,
    this.mainTransactionId,
    required this.uniqueCode,
    this.usedGiftBalances,
    required this.cashbackAmount,
  });

  factory WalletTransactionResponseData.fromJson(Map<String, dynamic> json) {
    return WalletTransactionResponseData(
      id: json['Id'],
      walletId: json['WalletId'],
      alias: json['Alias'],
      transactionType: json['TransactionType'],
      amount: (json['Amount'] as num).toDouble(),
      giftAmount: (json['GiftAmount'] as num?)?.toDouble(),
      description: json['Description'],
      externalReference: json['ExternalReference'],
      createdAt: DateTime.parse(json['CreatedAt']),
      updatedAt: json['UpdatedAt'] != null ? DateTime.parse(json['UpdatedAt']) : null,
      balanceAfterTransaction: (json['BalanceAfterTransaction'] as num).toDouble(),
      blockedBalanceAfterTransaction: (json['BlockedBalanceAfterTransaction'] as num?)?.toDouble(),
      availableBalanceAfterTransaction: (json['AvailableBalanceAfterTransaction'] as num?)?.toDouble(),
      giftBalanceBalanceAfterTransaction: (json['GiftBalanceBalanceAfterTransaction'] as num?)?.toDouble(),
      currencyCode: json['CurrencyCode'],
      sourceWalletId: json['SourceWalletId'],
      destinationWalletId: json['DestinationWalletId'],
      giftBalanceId: json['GiftBalanceId']?.toString(),
      mainTransactionId: json['MainTransactionId'],
      uniqueCode: json['UniqueCode'],
      usedGiftBalances: json['UsedGiftBalances'],
      cashbackAmount: (json['CashbackAmount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'WalletId': walletId,
      'Alias': alias,
      'TransactionType': transactionType,
      'Amount': amount,
      'GiftAmount': giftAmount,
      'Description': description,
      'ExternalReference': externalReference,
      'CreatedAt': createdAt.toIso8601String(),
      'UpdatedAt': updatedAt?.toIso8601String(),
      'BalanceAfterTransaction': balanceAfterTransaction,
      'BlockedBalanceAfterTransaction': blockedBalanceAfterTransaction,
      'AvailableBalanceAfterTransaction': availableBalanceAfterTransaction,
      'GiftBalanceBalanceAfterTransaction': giftBalanceBalanceAfterTransaction,
      'CurrencyCode': currencyCode,
      'SourceWalletId': sourceWalletId,
      'DestinationWalletId': destinationWalletId,
      'GiftBalanceId': giftBalanceId,
      'MainTransactionId': mainTransactionId,
      'UniqueCode': uniqueCode,
      'UsedGiftBalances': usedGiftBalances,
      'CashbackAmount': cashbackAmount,
    };
  }
}
