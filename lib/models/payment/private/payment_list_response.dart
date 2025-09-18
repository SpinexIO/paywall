/// Response model for Payment List API
class PaymentListResponse {
  final String sortType;
  final int page;
  final int pageSize;
  final int totalRecords;
  final List<PaymentTransaction> data;
  final bool hasPreviousPage;
  final bool hasNextPage;

  PaymentListResponse({
    required this.sortType,
    required this.page,
    required this.pageSize,
    required this.totalRecords,
    required this.data,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory PaymentListResponse.fromJson(Map<String, dynamic> json) {
    return PaymentListResponse(
      sortType: json['SortType'] ?? '',
      page: json['Page'] ?? 0,
      pageSize: json['PageSize'] ?? 0,
      totalRecords: json['TotalRecords'] ?? 0,
      data: (json['Data'] as List<dynamic>? ?? []).map((e) => PaymentTransaction.fromJson(e)).toList(),
      hasPreviousPage: json['HasPreviousPage'] ?? false,
      hasNextPage: json['HasNextPage'] ?? false,
    );
  }
}

class PaymentTransaction {
  final int id;
  final int posType;
  final int? regionId;
  final String uniqueCode;
  final String merchantUniqueCode;
  final String? trackingCode;
  final double amount;
  final int methodId;
  final int typeId;
  final int statusId;
  final int installment;
  final int? channelId;
  final int? tagId;
  final String ip;
  final String? clientIp;
  final DateTime insertDateTime;
  final CardInfo card;
  final CommissionInfo commission;
  final PaymentGatewayInfo paymentGateway;

  PaymentTransaction({
    required this.id,
    required this.posType,
    this.regionId,
    required this.uniqueCode,
    required this.merchantUniqueCode,
    this.trackingCode,
    required this.amount,
    required this.methodId,
    required this.typeId,
    required this.statusId,
    required this.installment,
    this.channelId,
    this.tagId,
    required this.ip,
    this.clientIp,
    required this.insertDateTime,
    required this.card,
    required this.commission,
    required this.paymentGateway,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) {
    return PaymentTransaction(
      id: json['Id'] ?? 0,
      posType: json['PosType'] ?? 0,
      regionId: json['RegionId'],
      uniqueCode: json['UniqueCode'] ?? '',
      merchantUniqueCode: json['MerchantUniqueCode'] ?? '',
      trackingCode: json['TrackingCode'],
      amount: (json['Amount'] as num).toDouble(),
      methodId: json['MethodId'] ?? 0,
      typeId: json['TypeId'] ?? 0,
      statusId: json['StatusId'] ?? 0,
      installment: json['Installment'] ?? 0,
      channelId: json['ChannelId'],
      tagId: json['TagId'],
      ip: json['Ip'] ?? '',
      clientIp: json['ClientIp'],
      insertDateTime: DateTime.parse(json['InsertDateTime']),
      card: CardInfo.fromJson(json['Card']),
      commission: CommissionInfo.fromJson(json['Commission']),
      paymentGateway: PaymentGatewayInfo.fromJson(json['PaymentGateway']),
    );
  }
}

class CardInfo {
  final String owner;
  final String number;

  CardInfo({required this.owner, required this.number});

  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(owner: json['Owner'] ?? '', number: json['Number'] ?? '');
  }
}

class CommissionInfo {
  final bool exists;
  final double? commission;
  final bool appliedInterest;
  final double? interest;
  final double originalAmount;
  final double? interestAmount;

  CommissionInfo({required this.exists, this.commission, required this.appliedInterest, this.interest, required this.originalAmount, this.interestAmount});

  factory CommissionInfo.fromJson(Map<String, dynamic> json) {
    return CommissionInfo(
      exists: json['Exists'] ?? false,
      commission: (json['Commission'] as num?)?.toDouble(),
      appliedInterest: json['AppliedInterest'] ?? false,
      interest: (json['Interest'] as num?)?.toDouble(),
      originalAmount: (json['OriginalAmount'] as num).toDouble(),
      interestAmount: (json['InterestAmount'] as num?)?.toDouble(),
    );
  }
}

class PaymentGatewayInfo {
  final int paymentGatewayId;
  final String paymentGatewayName;
  final String paymentGatewayProviderName;

  PaymentGatewayInfo({required this.paymentGatewayId, required this.paymentGatewayName, required this.paymentGatewayProviderName});

  factory PaymentGatewayInfo.fromJson(Map<String, dynamic> json) {
    return PaymentGatewayInfo(
      paymentGatewayId: json['PaymentGatewayId'] ?? 0,
      paymentGatewayName: json['PaymentGatewayName'] ?? '',
      paymentGatewayProviderName: json['PaymentGatewayProviderName'] ?? '',
    );
  }
}
