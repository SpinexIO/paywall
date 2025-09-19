/// Wallet Deposit Response Data
/// Hint: Represents the transaction detail returned after a deposit.
class WalletDepositResponseData {
  final String id;
  final String alias;
  final String walletId;
  final String transactionType;
  final double amount;
  final double? giftAmount;
  final String? description;
  final String externalReference;
  final String createdAt;
  final String? updatedAt;
  final double balanceAfterTransaction;
  final String? giftBalanceId;
  final String uniqueCode;
  final double cashbackAmount;

  WalletDepositResponseData({
    required this.id,
    required this.alias,
    required this.walletId,
    required this.transactionType,
    required this.amount,
    this.giftAmount,
    this.description,
    required this.externalReference,
    required this.createdAt,
    this.updatedAt,
    required this.balanceAfterTransaction,
    this.giftBalanceId,
    required this.uniqueCode,
    required this.cashbackAmount,
  });

  /// Creates [WalletDepositResponseData] from JSON
  factory WalletDepositResponseData.fromJson(Map<String, dynamic> json) {
    return WalletDepositResponseData(
      id: json['Id'] ?? '',
      alias: json['Alias'] ?? '',
      walletId: json['WalletId'] ?? '',
      transactionType: json['TransactionType'] ?? '',
      amount: (json['Amount'] as num?)?.toDouble() ?? 0.0,
      giftAmount: (json['GiftAmount'] as num?)?.toDouble(),
      description: json['Description'],
      externalReference: json['ExternalReference'] ?? '',
      createdAt: json['CreatedAt'] ?? '',
      updatedAt: json['UpdatedAt'],
      balanceAfterTransaction: (json['BalanceAfterTransaction'] as num?)?.toDouble() ?? 0.0,
      giftBalanceId: json['GiftBalanceId'],
      uniqueCode: json['UniqueCode'] ?? '',
      cashbackAmount: (json['CashbackAmount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  /// Converts [WalletDepositResponseData] to JSON
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Alias": alias,
      "WalletId": walletId,
      "TransactionType": transactionType,
      "Amount": amount,
      "GiftAmount": giftAmount,
      "Description": description,
      "ExternalReference": externalReference,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "BalanceAfterTransaction": balanceAfterTransaction,
      "GiftBalanceId": giftBalanceId,
      "UniqueCode": uniqueCode,
      "CashbackAmount": cashbackAmount,
    };
  }
}
