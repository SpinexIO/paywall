/// Product model
class Product {
  final String name;
  final int taxGroupId;
  final int unitCodeId;
  final int? paymentMethodId;
  final String? currencyId;
  final double amount;
  final int quantity;

  Product({
    required this.name,
    required this.taxGroupId,
    required this.unitCodeId,
    this.paymentMethodId,
    this.currencyId,
    required this.amount,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    'Name': name,
    'TaxGroupId': taxGroupId,
    'UnitCodeId': unitCodeId,
    if (paymentMethodId != null) 'PaymentMethodId': paymentMethodId,
    if (currencyId != null) 'CurrencyId': currencyId,
    'Amount': amount,
    'Quantity': quantity,
  };

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['Name'],
      taxGroupId: json['TaxGroupId'],
      unitCodeId: json['UnitCodeId'],
      paymentMethodId: json['PaymentMethodId'],
      currencyId: json['CurrencyId'],
      amount: (json['Amount'] as num).toDouble(),
      quantity: json['Quantity'],
    );
  }
}
