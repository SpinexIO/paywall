/// Model for creating a new member request.
/// Contains all required and optional parameters for the member creation API.

class MemberCreateRequest {
  final bool isSubMerchant;
  final int? memberType; // Required if isSubMerchant = true
  final String memberExternalId;
  final String memberName;
  final String memberTitle;
  final String? memberTaxOffice; // Required if company
  final String? memberTaxNumber; // Required if company
  final String? memberIdentityNumber; // Required if individual
  final String memberEmail;
  final String memberPhone;
  final String memberAddress;
  final String? contactName; // Required if individual
  final String? contactLastname; // Required if individual
  final List<BankAccount>? bankAccounts;
  final ValueDate? valueDate;

  MemberCreateRequest({
    required this.isSubMerchant,
    this.memberType,
    required this.memberExternalId,
    required this.memberName,
    required this.memberTitle,
    this.memberTaxOffice,
    this.memberTaxNumber,
    this.memberIdentityNumber,
    required this.memberEmail,
    required this.memberPhone,
    required this.memberAddress,
    this.contactName,
    this.contactLastname,
    this.bankAccounts,
    this.valueDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "IsSubMerchant": isSubMerchant,
      "MemberType": memberType,
      "MemberExternalId": memberExternalId,
      "MemberName": memberName,
      "MemberTitle": memberTitle,
      "MemberTaxOffice": memberTaxOffice,
      "MemberTaxNumber": memberTaxNumber,
      "MemberIdentityNumber": memberIdentityNumber,
      "MemberEmail": memberEmail,
      "MemberPhone": memberPhone,
      "MemberAddress": memberAddress,
      "ContactName": contactName,
      "ContactLastname": contactLastname,
      "BankAccounts": bankAccounts?.map((b) => b.toJson()).toList(),
      "ValueDate": valueDate?.toJson(),
    };
  }
}

/// Bank account details for the member.
/// Used if member has bank account information.
class BankAccount {
  final int currencyId;
  final String title;
  final String iban;

  BankAccount({required this.currencyId, required this.title, required this.iban});

  Map<String, dynamic> toJson() {
    return {"CurrencyId": currencyId, "Title": title, "Iban": iban};
  }
}

/// Value date details for commission and payment schedule.
class ValueDate {
  final int calculationType; // 1=PlusDay, 2=ADayOfWeek, 3=ADayOfMonth
  final int calculationValue;
  final double commission;

  ValueDate({required this.calculationType, required this.calculationValue, required this.commission});

  Map<String, dynamic> toJson() {
    return {"CalculationType": calculationType, "CalculationValue": calculationValue, "Commission": commission};
  }
}
