/// Single payment item from the list
class PaymentListItem {
  final String id;
  final String terminalId;
  final String connectionId;
  final String connectionName;
  final int providerId;
  final String providerName;
  final int brandId;
  final String brandName;
  final int regionId;
  final String regionName;
  final String merchantUniqueCode;
  final String displayCode;
  final double amount;
  final int paymentChannelId;
  final String paymentChannelName;
  final int currencyId;
  final String currencyName;
  final String ip;
  final String paymentRequestActivityId;
  final int paymentTypeId;
  final String paymentTypeName;
  final int paymentStatusId;
  final String paymentStatusName;
  final DateTime date;

  PaymentListItem({
    required this.id,
    required this.terminalId,
    required this.connectionId,
    required this.connectionName,
    required this.providerId,
    required this.providerName,
    required this.brandId,
    required this.brandName,
    required this.regionId,
    required this.regionName,
    required this.merchantUniqueCode,
    required this.displayCode,
    required this.amount,
    required this.paymentChannelId,
    required this.paymentChannelName,
    required this.currencyId,
    required this.currencyName,
    required this.ip,
    required this.paymentRequestActivityId,
    required this.paymentTypeId,
    required this.paymentTypeName,
    required this.paymentStatusId,
    required this.paymentStatusName,
    required this.date,
  });

  factory PaymentListItem.fromJson(Map<String, dynamic> json) {
    return PaymentListItem(
      id: json['Id'],
      terminalId: json['TerminalId'],
      connectionId: json['ConnectionId'],
      connectionName: json['ConnectionName'],
      providerId: json['ProviderId'],
      providerName: json['ProviderName'],
      brandId: json['BrandId'],
      brandName: json['BrandName'],
      regionId: json['RegionId'],
      regionName: json['RegionName'],
      merchantUniqueCode: json['MerchantUniqueCode'],
      displayCode: json['DisplayCode'],
      amount: (json['Amount'] as num).toDouble(),
      paymentChannelId: json['PaymentChannelId'],
      paymentChannelName: json['PaymentChannelName'],
      currencyId: json['CurrencyId'],
      currencyName: json['CurrencyName'],
      ip: json['IP'],
      paymentRequestActivityId: json['PaymentRequestActivityId'],
      paymentTypeId: json['PaymentTypeId'],
      paymentTypeName: json['PaymentTypeName'],
      paymentStatusId: json['PaymentStatusId'],
      paymentStatusName: json['PaymentStatusName'],
      date: DateTime.parse(json['Date']),
    );
  }
}

/// Pagination info
class Pagination {
  final int currentPage;
  final int pageCount;
  final int pageSize;
  final int totalCount;

  Pagination({required this.currentPage, required this.pageCount, required this.pageSize, required this.totalCount});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(currentPage: json['CurrentPage'], pageCount: json['PageCount'], pageSize: json['PageSize'], totalCount: json['TotalCount']);
  }
}

/// Main response model for payment list
class PaymentListResponse {
  final List<PaymentListItem> items;
  final Pagination pagination;
  final bool failed;
  final String? message;
  final String? clientMessage;
  final bool succeeded;

  PaymentListResponse({required this.items, required this.pagination, required this.failed, this.message, this.clientMessage, required this.succeeded});

  factory PaymentListResponse.fromJson(Map<String, dynamic> json) {
    final result = json['Result'] ?? {};
    return PaymentListResponse(
      items: (result['Items'] as List<dynamic>).map((e) => PaymentListItem.fromJson(e)).toList(),
      pagination: Pagination.fromJson(result['Pagination']),
      failed: json['Failed'] ?? false,
      message: json['Message'],
      clientMessage: json['ClientMessage'],
      succeeded: json['Succeeded'] ?? false,
    );
  }
}
