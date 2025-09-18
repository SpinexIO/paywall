/// Response model for member list API.
/// Contains list of members with detailed information.
class MemberListResponse {
  final int errorCode;
  final bool result;
  final String message;
  final List<MemberListItem> body;

  MemberListResponse({required this.errorCode, required this.result, required this.message, required this.body});

  factory MemberListResponse.fromJson(Map<String, dynamic> json) {
    return MemberListResponse(
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'] ?? '',
      body: (json['Body'] as List<dynamic>).map((e) => MemberListItem.fromJson(e)).toList(),
    );
  }
}

/// Represents a single member item in the list.
class MemberListItem {
  final int id;
  final bool isSubMerchant;
  final int memberType;
  final String memberExternalId;
  final String memberName;
  final String memberTitle;
  final String? memberTaxOffice;
  final String? memberTaxNumber;
  final String? memberIdentityNumber;
  final String memberEmail;
  final String memberPhone;
  final String memberAddress;
  final String? contactName;
  final String? contactLastname;
  final List<MemberBankAccount>? bankAccounts;
  final MemberValueDate? valueDate;
  final String insertDateTime;
  final String updateDateTime;

  MemberListItem({
    required this.id,
    required this.isSubMerchant,
    required this.memberType,
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
    required this.insertDateTime,
    required this.updateDateTime,
  });

  factory MemberListItem.fromJson(Map<String, dynamic> json) {
    return MemberListItem(
      id: json['Id'],
      isSubMerchant: json['IsSubMerchant'],
      memberType: json['MemberType'],
      memberExternalId: json['MemberExternalId'],
      memberName: json['MemberName'],
      memberTitle: json['MemberTitle'],
      memberTaxOffice: json['MemberTaxOffice'],
      memberTaxNumber: json['MemberTaxNumber'],
      memberIdentityNumber: json['MemberIdentityNumber'],
      memberEmail: json['MemberEmail'],
      memberPhone: json['MemberPhone'],
      memberAddress: json['MemberAddress'],
      contactName: json['ContactName'],
      contactLastname: json['ContactLastname'],
      bankAccounts: json['BankAccounts'] != null ? (json['BankAccounts'] as List<dynamic>).map((e) => MemberBankAccount.fromJson(e)).toList() : null,
      valueDate: json['ValueDate'] != null ? MemberValueDate.fromJson(json['ValueDate']) : null,
      insertDateTime: json['InsertDateTime'],
      updateDateTime: json['UpdateDateTime'],
    );
  }
}

/// Bank account information for a member.
class MemberBankAccount {
  final int id;
  final int currencyId;
  final String currency;
  final String title;
  final String iban;

  MemberBankAccount({required this.id, required this.currencyId, required this.currency, required this.title, required this.iban});

  factory MemberBankAccount.fromJson(Map<String, dynamic> json) {
    return MemberBankAccount(id: json['Id'], currencyId: json['CurrencyId'], currency: json['Currency'], title: json['Title'], iban: json['Iban']);
  }
}

/// Value date and commission information for a member.
class MemberValueDate {
  final int id;
  final int calculationType;
  final int calculationValue;
  final double commission;

  MemberValueDate({required this.id, required this.calculationType, required this.calculationValue, required this.commission});

  factory MemberValueDate.fromJson(Map<String, dynamic> json) {
    return MemberValueDate(
      id: json['Id'],
      calculationType: json['CalculationType'],
      calculationValue: json['CalculationValue'],
      commission: (json['Commission'] as num).toDouble(),
    );
  }
}
