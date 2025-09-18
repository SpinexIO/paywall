import '../common/pagination.dart';

/// Single product in a payment
class PaymentProductItem {
  final String id;
  final String name;
  final double amount;
  final int quantity;
  final int taxGroupId;
  final String taxGroupName;
  final int unitCodeId;
  final String unitCodeName;

  PaymentProductItem({
    required this.id,
    required this.name,
    required this.amount,
    required this.quantity,
    required this.taxGroupId,
    required this.taxGroupName,
    required this.unitCodeId,
    required this.unitCodeName,
  });

  factory PaymentProductItem.fromJson(Map<String, dynamic> json) {
    return PaymentProductItem(
      id: json['Id'],
      name: json['Name'],
      amount: (json['Amount'] as num).toDouble(),
      quantity: json['Quantity'],
      taxGroupId: json['TaxGroupId'],
      taxGroupName: json['TaxGroupName'],
      unitCodeId: json['UnitCodeId'],
      unitCodeName: json['UnitCodeName'],
    );
  }
}

/// Response model for payment products
class PaymentProductsResponse {
  final List<PaymentProductItem> items;
  final Pagination pagination;
  final bool failed;
  final String? message;
  final String? clientMessage;
  final bool succeeded;

  PaymentProductsResponse({required this.items, required this.pagination, required this.failed, this.message, this.clientMessage, required this.succeeded});

  factory PaymentProductsResponse.fromJson(Map<String, dynamic> json) {
    final result = json['Result'] ?? {};
    return PaymentProductsResponse(
      items: (result['Items'] as List<dynamic>).map((e) => PaymentProductItem.fromJson(e)).toList(),
      pagination: Pagination.fromJson(result['Pagination']),
      failed: json['Failed'] ?? false,
      message: json['Message'],
      clientMessage: json['ClientMessage'],
      succeeded: json['Succeeded'] ?? false,
    );
  }
}
