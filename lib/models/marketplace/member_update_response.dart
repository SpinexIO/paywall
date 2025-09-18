/// Response model for member update API.
/// Includes standard API response fields and updated member body details.
class MemberUpdateResponse {
  final int errorCode;
  final bool result;
  final String message;
  final MemberUpdateBody? body;

  MemberUpdateResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory MemberUpdateResponse.fromJson(Map<String, dynamic> json) {
    return MemberUpdateResponse(
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'] ?? '',
      body: json['Body'] != null ? MemberUpdateBody.fromJson(json['Body']) : null,
    );
  }
}

/// Member details returned after update.
class MemberUpdateBody {
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
  final String insertDateTime;

  MemberUpdateBody({
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
    required this.insertDateTime,
  });

  factory MemberUpdateBody.fromJson(Map<String, dynamic> json) {
    return MemberUpdateBody(
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
      insertDateTime: json['InsertDateTime'],
    );
  }
}
