/// Wallet Owner Update Request model
/// Hint: Represents the payload required to update a wallet owner.
class WalletOwnerUpdateRequest {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String country;
  final String city;
  final String? dateOfBirth;
  final String? companyName;

  WalletOwnerUpdateRequest({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.country,
    required this.city,
    this.dateOfBirth,
    this.companyName,
  });

  /// Converts [WalletOwnerUpdateRequest] to JSON
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Name": name,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "Address": address,
      "Country": country,
      "City": city,
      "DateOfBirth": dateOfBirth,
      "CompanyName": companyName,
    };
  }
}
