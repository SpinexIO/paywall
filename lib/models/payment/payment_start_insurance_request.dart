import 'package:paywall/models/payment/payment_start_request.dart';

/// Request model for starting a direct (non-secure) insurance payment.
/// This method uses the first 8 and last 4 digits of the card number.
class PaymentStartInsuranceRequest {
  final PaymentDetail paymentDetail;
  final InsuranceCard card;
  final Customer customer;
  final List<Product> products;

  PaymentStartInsuranceRequest({required this.paymentDetail, required this.card, required this.customer, required this.products});

  Map<String, dynamic> toJson() {
    return {
      "PaymentDetail": paymentDetail.toJson(),
      "Card": card.toJson(),
      "Customer": customer.toJson(),
      "Products": products.map((e) => e.toJson()).toList(),
    };
  }
}

/// Card information specific for insurance payments.
/// Uses first 8 and last 4 digits instead of full card number.
class InsuranceCard {
  final String ownerName;
  final String cardNoFirst;
  final String cardNoLast;
  final String identityNumber;
  final bool? useAdditionalIdentityNumber;
  final String? additionalIdentityNumber;
  final String? uniqueCode;
  final String? tempCardToken;
  final CardSave? cardSave;

  InsuranceCard({
    required this.ownerName,
    required this.cardNoFirst,
    required this.cardNoLast,
    required this.identityNumber,
    this.useAdditionalIdentityNumber,
    this.additionalIdentityNumber,
    this.uniqueCode,
    this.tempCardToken,
    this.cardSave,
  });

  Map<String, dynamic> toJson() {
    return {
      "OwnerName": ownerName,
      "CardNoFirst": cardNoFirst,
      "CardNoLast": cardNoLast,
      "IdentityNumber": identityNumber,
      "UseAdditionalIdentityNumber": useAdditionalIdentityNumber,
      "AdditionalIdentityNumber": additionalIdentityNumber,
      "UniqueCode": uniqueCode,
      "TempCardToken": tempCardToken,
      "CardSave": cardSave?.toJson(),
    };
  }
}

/// Reuses CardSave model from payment_start_request.dart
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
