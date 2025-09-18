/// Request model for starting a split payment
class SplitPaymentRequest {
  final PaymentDetail paymentDetail;
  final int cardModel; // 1: Ecommerce | 2: Insurance
  final List<SplitPaymentItem> payments;

  SplitPaymentRequest({required this.paymentDetail, required this.cardModel, required this.payments});

  Map<String, dynamic> toJson() {
    return {'PaymentDetail': paymentDetail.toJson(), 'CardModel': cardModel, 'Payments': payments.map((e) => e.toJson()).toList()};
  }
}

/// PaymentDetail object
class PaymentDetail {
  final double amount;
  final String merchantUniqueCode;
  final int currencyId;
  final int installment;
  final String callbackAddress;
  final String clientIp;
  final bool half2D;
  final bool providerBased;
  final String? providerKey;
  final bool posBased;
  final int? posId;
  final bool autoRollback;

  PaymentDetail({
    required this.amount,
    required this.merchantUniqueCode,
    required this.currencyId,
    required this.installment,
    required this.callbackAddress,
    required this.clientIp,
    this.half2D = false,
    this.providerBased = false,
    this.providerKey,
    this.posBased = false,
    this.posId,
    this.autoRollback = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount,
      'MerchantUniqueCode': merchantUniqueCode,
      'CurrencyId': currencyId,
      'Installment': installment,
      'CallbackAddress': callbackAddress,
      'ClientIP': clientIp,
      'Half2D': half2D,
      'ProviderBased': providerBased,
      'ProviderKey': providerKey,
      'PosBased': posBased,
      'PosId': posId,
      'AutoRollback': autoRollback,
    };
  }
}

/// Single Payment item
class SplitPaymentItem {
  final Customer customer;
  final Product product;
  final CardInfo card;

  SplitPaymentItem({required this.customer, required this.product, required this.card});

  Map<String, dynamic> toJson() {
    return {'Customer': customer.toJson(), 'Product': product.toJson(), 'Card': card.toJson()};
  }
}

/// Customer object
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

  Map<String, dynamic> toJson() {
    return {
      'FullName': fullName,
      'Phone': phone,
      'Email': email,
      'Country': country,
      'City': city,
      'Address': address,
      'IdentityNumber': identityNumber,
      'TaxNumber': taxNumber,
    };
  }
}

/// Product object
class Product {
  final String productId;
  final String productName;
  final String productCategory;
  final String? productDescription;
  final double productAmount;

  Product({required this.productId, required this.productName, required this.productCategory, this.productDescription, required this.productAmount});

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'ProductName': productName,
      'ProductCategory': productCategory,
      'ProductDescription': productDescription,
      'ProductAmount': productAmount,
    };
  }
}

/// Card object
class CardInfo {
  final String ownerName;
  final String? number;
  final String? expireMonth;
  final String? expireYear;
  final String? cvv;
  final String? cardNoFirst;
  final String? cardNoLast;
  final String? identityNumber;

  CardInfo({required this.ownerName, this.number, this.expireMonth, this.expireYear, this.cvv, this.cardNoFirst, this.cardNoLast, this.identityNumber});

  Map<String, dynamic> toJson() {
    return {
      'OwnerName': ownerName,
      'Number': number,
      'ExpireMonth': expireMonth,
      'ExpireYear': expireYear,
      'Cvv': cvv,
      'CardNoFirst': cardNoFirst,
      'CardNoLast': cardNoLast,
      'IdentityNumber': identityNumber,
    };
  }
}
