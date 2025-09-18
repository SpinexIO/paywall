/// Request model for updating an existing member.
/// Contains all required parameters for the member update API.
class MemberUpdateRequest {
  final int id; // Member ID in Paywall
  final bool isSubMerchant;
  final int? memberType;
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

  MemberUpdateRequest({
    required this.id,
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
  });

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
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
    };
  }
}
