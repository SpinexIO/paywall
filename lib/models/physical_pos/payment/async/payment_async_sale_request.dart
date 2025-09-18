/// Async Payment Sale Request model
class PaymentAsyncSaleRequest {
  final String? terminalId;
  final String? terminalTagCode;
  final String merchantUniqueCode;
  final String? displayCode;
  final double amount;
  final int currencyId;
  final List<PaymentMethod>? methods;
  final String? callbackAddress;
  final bool splitPaymentSupport;
  final Customer? customer;
  final List<Product> products;
  final bool skipPrintCustomer;
  final bool skipPrintMerchant;
  final bool skipPaymentOptionScreen;
  final ReceiptOptions? receiptOptions;

  PaymentAsyncSaleRequest({
    this.terminalId,
    this.terminalTagCode,
    required this.merchantUniqueCode,
    this.displayCode,
    required this.amount,
    required this.currencyId,
    this.methods,
    this.callbackAddress,
    this.splitPaymentSupport = false,
    this.customer,
    required this.products,
    this.skipPrintCustomer = false,
    this.skipPrintMerchant = false,
    this.skipPaymentOptionScreen = false,
    this.receiptOptions,
  });

  Map<String, dynamic> toJson() {
    return {
      if (terminalId != null) 'TerminalId': terminalId,
      if (terminalTagCode != null) 'TerminalTagCode': terminalTagCode,
      'MerchantUniqueCode': merchantUniqueCode,
      if (displayCode != null) 'DisplayCode': displayCode,
      'Amount': amount,
      'CurrencyId': currencyId,
      if (methods != null) 'Methods': methods!.map((m) => m.toJson()).toList(),
      if (callbackAddress != null) 'CallbackAddress': callbackAddress,
      'SplitPaymentSupport': splitPaymentSupport,
      if (customer != null) 'Customer': customer!.toJson(),
      'Products': products.map((p) => p.toJson()).toList(),
      'SkipPrintCustomer': skipPrintCustomer,
      'SkipPrintMerchant': skipPrintMerchant,
      'SkipPaymentOptionScreen': skipPaymentOptionScreen,
      if (receiptOptions != null) 'ReceiptOptions': receiptOptions!.toJson(),
    };
  }
}

/// Payment Method object
class PaymentMethod {
  final int paymentMethodId;

  PaymentMethod({required this.paymentMethodId});

  Map<String, dynamic> toJson() => {'PaymentMethodId': paymentMethodId};
}

/// Customer object
class Customer {
  final int type;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? companyName;
  final String? taxOfficeCode;
  final String? taxNumber;
  final String? phone;
  final String? email;
  final String? identity;
  final String? country;
  final String? city;
  final String? district;
  final String? neighborhood;
  final String? address;

  Customer({
    required this.type,
    this.firstName,
    this.middleName,
    this.lastName,
    this.companyName,
    this.taxOfficeCode,
    this.taxNumber,
    this.phone,
    this.email,
    this.identity,
    this.country,
    this.city,
    this.district,
    this.neighborhood,
    this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'Type': type,
      if (firstName != null) 'FirstName': firstName,
      if (middleName != null) 'MiddleName': middleName,
      if (lastName != null) 'LastName': lastName,
      if (companyName != null) 'CompanyName': companyName,
      if (taxOfficeCode != null) 'TaxOfficeCode': taxOfficeCode,
      if (taxNumber != null) 'TaxNumber': taxNumber,
      if (phone != null) 'Phone': phone,
      if (email != null) 'Email': email,
      if (identity != null) 'Identity': identity,
      if (country != null) 'Country': country,
      if (city != null) 'City': city,
      if (district != null) 'District': district,
      if (neighborhood != null) 'Neighborhood': neighborhood,
      if (address != null) 'Address': address,
    };
  }
}

/// Product object
class Product {
  final String name;
  final int taxGroupId;
  final int unitCodeId;
  final int currencyId;
  final double amount;
  final int quantity;
  final int? paymentMethodId;

  Product({
    required this.name,
    required this.taxGroupId,
    required this.unitCodeId,
    required this.currencyId,
    required this.amount,
    required this.quantity,
    this.paymentMethodId,
  });

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'TaxGroupId': taxGroupId,
      'UnitCodeId': unitCodeId,
      'CurrencyId': currencyId,
      'Amount': amount,
      'Quantity': quantity,
      if (paymentMethodId != null) 'PaymentMethodId': paymentMethodId,
    };
  }
}

/// Receipt Options object
class ReceiptOptions {
  final bool topSupport;
  final ReceiptText? top;
  final bool bottomSupport;
  final ReceiptText? bottom;

  ReceiptOptions({required this.topSupport, this.top, required this.bottomSupport, this.bottom});

  Map<String, dynamic> toJson() {
    return {'TopSupport': topSupport, if (top != null) 'Top': top!.toJson(), 'BottomSupport': bottomSupport, if (bottom != null) 'Bottom': bottom!.toJson()};
  }
}

class ReceiptText {
  final String text;
  final int fontSize;

  ReceiptText({required this.text, required this.fontSize});

  Map<String, dynamic> toJson() => {'Text': text, 'FontSize': fontSize};
}
