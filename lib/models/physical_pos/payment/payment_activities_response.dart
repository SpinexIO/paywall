/// Single activity record of a payment
class PaymentActivityItem {
  final String id;
  final int paymentTypeId;
  final String paymentTypeName;
  final int paymentStatusId;
  final String paymentStatusName;
  final DateTime date;

  PaymentActivityItem({
    required this.id,
    required this.paymentTypeId,
    required this.paymentTypeName,
    required this.paymentStatusId,
    required this.paymentStatusName,
    required this.date,
  });

  factory PaymentActivityItem.fromJson(Map<String, dynamic> json) {
    return PaymentActivityItem(
      id: json['Id'],
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

/// Main response model for payment activities
class PaymentActivitiesResponse {
  final List<PaymentActivityItem> items;
  final Pagination pagination;
  final bool failed;
  final String? message;
  final String? clientMessage;
  final bool succeeded;

  PaymentActivitiesResponse({required this.items, required this.pagination, required this.failed, this.message, this.clientMessage, required this.succeeded});

  factory PaymentActivitiesResponse.fromJson(Map<String, dynamic> json) {
    final result = json['Result'] ?? {};
    return PaymentActivitiesResponse(
      items: (result['Items'] as List<dynamic>).map((e) => PaymentActivityItem.fromJson(e)).toList(),
      pagination: Pagination.fromJson(result['Pagination']),
      failed: json['Failed'] ?? false,
      message: json['Message'],
      clientMessage: json['ClientMessage'],
      succeeded: json['Succeeded'] ?? false,
    );
  }
}
