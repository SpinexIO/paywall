/// Request model for bulk (Storm 🍃) payments.
class StormPaymentRequest {
  final PaymentDetail paymentDetail;
  final int cardMethod; // 1: General card, 2: Single card per product
  final int cardModel; // 1: ECommerce, 2: Insurance
  final List<StormPaymentItem> payments;

  StormPaymentRequest({required this.paymentDetail, required this.cardMethod, required this.cardModel, required this.payments});

  factory StormPaymentRequest.fromJson(Map<String, dynamic> json) {
    return StormPaymentRequest(
      paymentDetail: PaymentDetail.fromJson(json['PaymentDetail']),
      cardMethod: json['CardMethod'] as int,
      cardModel: json['CardModel'] as int,
      payments: (json['Payments'] as List).map((e) => StormPaymentItem.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'PaymentDetail': paymentDetail.toJson(), 'CardMethod': cardMethod, 'CardModel': cardModel, 'Payments': payments.map((e) => e.toJson()).toList()};
  }
}

class PaymentDetail {
  final double amount;
  final String merchantUniqueCode;
  final int currencyId;
  final int installment;
  final String callbackAddress;
  final String clientIp;
  final bool half2D;
  final bool callbackBodySplit;
  final bool callbackBodyCompression;

  PaymentDetail({
    required this.amount,
    required this.merchantUniqueCode,
    required this.currencyId,
    required this.installment,
    required this.callbackAddress,
    required this.clientIp,
    this.half2D = false,
    this.callbackBodySplit = false,
    this.callbackBodyCompression = false,
  });

  factory PaymentDetail.fromJson(Map<String, dynamic> json) {
    return PaymentDetail(
      amount: (json['Amount'] as num).toDouble(),
      merchantUniqueCode: json['MerchantUniqueCode'],
      currencyId: json['CurrencyId'],
      installment: json['Installment'],
      callbackAddress: json['CallbackAddress'],
      clientIp: json['ClientIP'],
      half2D: json['Half2D'] ?? false,
      callbackBodySplit: json['CallbackBodySplit'] ?? false,
      callbackBodyCompression: json['CallbackBodyCompression'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount,
      'MerchantUniqueCode': merchantUniqueCode,
      'CurrencyId': currencyId,
      'Installment': installment,
      'CallbackAddress': callbackAddress,
      'ClientIP': clientIp,
      'Half2D': half2D,
      'CallbackBodySplit': callbackBodySplit,
      'CallbackBodyCompression': callbackBodyCompression,
    };
  }
}

class StormPaymentItem {
  final Customer customer;
  final Product product;
  final CardInfo card;

  StormPaymentItem({required this.customer, required this.product, required this.card});

  factory StormPaymentItem.fromJson(Map<String, dynamic> json) {
    return StormPaymentItem(customer: Customer.fromJson(json['Customer']), product: Product.fromJson(json['Product']), card: CardInfo.fromJson(json['Card']));
  }

  Map<String, dynamic> toJson() {
    return {'Customer': customer.toJson(), 'Product': product.toJson(), 'Card': card.toJson()};
  }
}

class Customer {
  final String fullName;
  final String phone;
  final String email;
  final String country;
  final String city;
  final String? address;
  final String? identityNumber;
  final String? taxNumber;

  Customer({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.country,
    required this.city,
    this.address,
    this.identityNumber,
    this.taxNumber,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      fullName: json['FullName'],
      phone: json['Phone'],
      email: json['Email'],
      country: json['Country'],
      city: json['City'],
      address: json['Address'],
      identityNumber: json['IdentityNumber'],
      taxNumber: json['TaxNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FullName': fullName,
      'Phone': phone,
      'Email': email,
      'Country': country,
      'City': city,
      if (address != null) 'Address': address,
      if (identityNumber != null) 'IdentityNumber': identityNumber,
      if (taxNumber != null) 'TaxNumber': taxNumber,
    };
  }
}

class Product {
  final String productId;
  final String productName;
  final String productCategory;
  final String? productDescription;
  final double productAmount;

  Product({required this.productId, required this.productName, required this.productCategory, this.productDescription, required this.productAmount});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['ProductId'],
      productName: json['ProductName'],
      productCategory: json['ProductCategory'],
      productDescription: json['ProductDescription'],
      productAmount: (json['ProductAmount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'ProductName': productName,
      'ProductCategory': productCategory,
      if (productDescription != null) 'ProductDescription': productDescription,
      'ProductAmount': productAmount,
    };
  }
}

class CardInfo {
  final String ownerName;
  final String number;
  final String expireMonth;
  final String expireYear;
  final String cvv;

  CardInfo({required this.ownerName, required this.number, required this.expireMonth, required this.expireYear, required this.cvv});

  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(ownerName: json['OwnerName'], number: json['Number'], expireMonth: json['ExpireMonth'], expireYear: json['ExpireYear'], cvv: json['Cvv']);
  }

  Map<String, dynamic> toJson() {
    return {'OwnerName': ownerName, 'Number': number, 'ExpireMonth': expireMonth, 'ExpireYear': expireYear, 'Cvv': cvv};
  }
}
