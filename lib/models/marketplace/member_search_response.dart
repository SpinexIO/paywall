/// Response model for member search API.
/// Contains details of a single member if found.
class MemberSearchResponse {
  final int errorCode;
  final bool result;
  final String message;
  final MemberSearchBody? body;

  MemberSearchResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory MemberSearchResponse.fromJson(Map<String, dynamic> json) {
    return MemberSearchResponse(
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'] ?? '',
      body: json['Body'] != null ? MemberSearchBody.fromJson(json['Body']) : null,
    );
  }
}

/// Member details returned from the search API.
class MemberSearchBody {
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
  final List<MemberSearchBankAccount>? bankAccounts;
  final MemberSearchValueDate? valueDate;
  final String insertDateTime;
  final String updateDateTime;

  MemberSearchBody({
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

  factory MemberSearchBody.fromJson(Map<String, dynamic> json) {
    return MemberSearchBody(
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
      bankAccounts: json['BankAccounts'] != null ? (json['BankAccounts'] as List<dynamic>).map((e) => MemberSearchBankAccount.fromJson(e)).toList() : null,
      valueDate: json['ValueDate'] != null ? MemberSearchValueDate.fromJson(json['ValueDate']) : null,
      insertDateTime: json['InsertDateTime'],
      updateDateTime: json['UpdateDateTime'],
    );
  }
}

/// Bank account details for a searched member.
class MemberSearchBankAccount {
  final int id;
  final int currencyId;
  final String currency;
  final String title;
  final String iban;

  MemberSearchBankAccount({required this.id, required this.currencyId, required this.currency, required this.title, required this.iban});

  factory MemberSearchBankAccount.fromJson(Map<String, dynamic> json) {
    return MemberSearchBankAccount(id: json['Id'], currencyId: json['CurrencyId'], currency: json['Currency'], title: json['Title'], iban: json['Iban']);
  }
}

/// Value date details for a searched member.
class MemberSearchValueDate {
  final int id;
  final int calculationType;
  final int calculationValue;
  final double commission;

  MemberSearchValueDate({required this.id, required this.calculationType, required this.calculationValue, required this.commission});

  factory MemberSearchValueDate.fromJson(Map<String, dynamic> json) {
    return MemberSearchValueDate(
      id: json['Id'],
      calculationType: json['CalculationType'],
      calculationValue: json['CalculationValue'],
      commission: (json['Commission'] as num).toDouble(),
    );
  }
}
