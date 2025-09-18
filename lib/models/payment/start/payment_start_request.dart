/// Request model for starting a direct (non-secure) payment.
class PaymentStartRequest {
  final PaymentDetail paymentDetail;
  final Card card;
  final Customer customer;
  final List<Product> products;

  PaymentStartRequest({required this.paymentDetail, required this.card, required this.customer, required this.products});

  Map<String, dynamic> toJson() {
    return {
      "PaymentDetail": paymentDetail.toJson(),
      "Card": card.toJson(),
      "Customer": customer.toJson(),
      "Products": products.map((e) => e.toJson()).toList(),
    };
  }
}

/// Payment detail information for the transaction.
class PaymentDetail {
  final double amount;
  final String merchantUniqueCode;
  final String? trackingCode;
  final bool half2D;
  final String clientIP;
  final int currencyId;
  final int installment;
  final int? channelId;
  final int? tagId;
  final int? endOfTheDay;
  final int? regionId;
  final bool? providerBased;
  final String? providerKey;
  final bool? posBased;
  final int? posId;
  final bool? payRouteByPass;
  final int? payRouteType;
  final String? routeGroupKey;
  final MarketPlace? marketPlace;

  PaymentDetail({
    required this.amount,
    required this.merchantUniqueCode,
    this.trackingCode,
    required this.half2D,
    required this.clientIP,
    required this.currencyId,
    required this.installment,
    this.channelId,
    this.tagId,
    this.endOfTheDay,
    this.regionId,
    this.providerBased,
    this.providerKey,
    this.posBased,
    this.posId,
    this.payRouteByPass,
    this.payRouteType,
    this.routeGroupKey,
    this.marketPlace,
  });

  Map<String, dynamic> toJson() {
    return {
      "Amount": amount,
      "MerchantUniqueCode": merchantUniqueCode,
      "TrackingCode": trackingCode,
      "Half2D": half2D,
      "ClientIP": clientIP,
      "CurrencyId": currencyId,
      "Installment": installment,
      "ChannelId": channelId,
      "TagId": tagId,
      "EndOfTheDay": endOfTheDay,
      "RegionId": regionId,
      "ProviderBased": providerBased,
      "ProviderKey": providerKey,
      "PosBased": posBased,
      "PosId": posId,
      "PayRouteByPass": payRouteByPass,
      "PayRouteType": payRouteType,
      "RouteGroupKey": routeGroupKey,
      "MarketPlace": marketPlace?.toJson(),
    };
  }
}

class MarketPlace {
  final double basketAmount;

  MarketPlace({required this.basketAmount});

  Map<String, dynamic> toJson() {
    return {"BasketAmount": basketAmount};
  }
}

/// Card information for the payment.
class Card {
  final String ownerName;
  final String number;
  final String expireMonth;
  final String expireYear;
  final String cvv;
  final bool? forceCvv;
  final String? uniqueCode;
  final String? tempCardToken;
  final Partner? partner;
  final CardSave? cardSave;

  Card({
    required this.ownerName,
    required this.number,
    required this.expireMonth,
    required this.expireYear,
    required this.cvv,
    this.forceCvv,
    this.uniqueCode,
    this.tempCardToken,
    this.partner,
    this.cardSave,
  });

  Map<String, dynamic> toJson() {
    return {
      "OwnerName": ownerName,
      "Number": number,
      "ExpireMonth": expireMonth,
      "ExpireYear": expireYear,
      "Cvv": cvv,
      "ForceCvv": forceCvv,
      "UniqueCode": uniqueCode,
      "TempCardToken": tempCardToken,
      "Partner": partner?.toJson(),
      "CardSave": cardSave?.toJson(),
    };
  }
}

class Partner {
  final bool partnerBased;
  final String partnerIdentity;

  Partner({required this.partnerBased, required this.partnerIdentity});

  Map<String, dynamic> toJson() {
    return {"PartnerBased": partnerBased, "PartnerIdentity": partnerIdentity};
  }
}

class CardSave {
  final String nickname;
  final String? relationalId1;
  final String? relationalId2;
  final String? relationalId3;
  final bool save;

  CardSave({required this.nickname, this.relationalId1, this.relationalId2, this.relationalId3, required this.save});

  Map<String, dynamic> toJson() {
    return {"Nickname": nickname, "RelationalId1": relationalId1, "RelationalId2": relationalId2, "RelationalId3": relationalId3, "Save": save};
  }
}

/// Customer information.
class Customer {
  final String fullName;
  final String phone;
  final String email;
  final String country;
  final String city;
  final String address;
  final String? identityNumber;
  final String? taxNumber;

  Customer({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.country,
    required this.city,
    required this.address,
    this.identityNumber,
    this.taxNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "FullName": fullName,
      "Phone": phone,
      "Email": email,
      "Country": country,
      "City": city,
      "Address": address,
      "IdentityNumber": identityNumber,
      "TaxNumber": taxNumber,
    };
  }
}

/// Product information for the payment.
class Product {
  final String productId;
  final String productName;
  final String productCategory;
  final String productDescription;
  final double productAmount;
  final int? memberId;
  final int? discountOwnerType;
  final int? discountType;
  final double? discountValue;
  final int? cargoType;
  final int? cargoCurrencyId;
  final double? cargoCost;
  final bool? memberCustomCommission;
  final double? memberCommission;
  final bool? memberEarningCalculated;
  final double? memberEarning;

  Product({
    required this.productId,
    required this.productName,
    required this.productCategory,
    required this.productDescription,
    required this.productAmount,
    this.memberId,
    this.discountOwnerType,
    this.discountType,
    this.discountValue,
    this.cargoType,
    this.cargoCurrencyId,
    this.cargoCost,
    this.memberCustomCommission,
    this.memberCommission,
    this.memberEarningCalculated,
    this.memberEarning,
  });

  Map<String, dynamic> toJson() {
    return {
      "ProductId": productId,
      "ProductName": productName,
      "ProductCategory": productCategory,
      "ProductDescription": productDescription,
      "ProductAmount": productAmount,
      "MemberId": memberId,
      "DiscountOwnerType": discountOwnerType,
      "DiscountType": discountType,
      "DiscountValue": discountValue,
      "CargoType": cargoType,
      "CargoCurrencyId": cargoCurrencyId,
      "CargoCost": cargoCost,
      "MemberCustomCommission": memberCustomCommission,
      "MemberCommission": memberCommission,
      "MemberEarningCalculated": memberEarningCalculated,
      "MemberEarning": memberEarning,
    };
  }
}
