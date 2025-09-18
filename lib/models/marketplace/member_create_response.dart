/// Response model for member creation API.
/// Includes standard API response fields and member body details.

class MemberCreateResponse {
  final int errorCode;
  final bool result;
  final String message;
  final MemberBody? body;

  MemberCreateResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory MemberCreateResponse.fromJson(Map<String, dynamic> json) {
    return MemberCreateResponse(
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'] ?? '',
      body: json['Body'] != null ? MemberBody.fromJson(json['Body']) : null,
    );
  }
}

/// Member body returned from API when creation is successful.
class MemberBody {
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

  MemberBody({
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

  factory MemberBody.fromJson(Map<String, dynamic> json) {
    return MemberBody(
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
