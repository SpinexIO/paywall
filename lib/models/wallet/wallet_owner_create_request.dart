/// Wallet Owner Create Request model
/// Hint: Represents the payload required to create a wallet owner.
class WalletOwnerCreateRequest {
  final String fullName;
  final String email;
  final String phoneNumber;
  final int ownerType; // 1: Individual | 2: Corporate
  final String? taxNumber; // Required for Corporate
  final String? identityNumber; // Required for Individual
  final String address;
  final String country;
  final String city;
  final String? dateOfBirth;
  final String? companyName;

  WalletOwnerCreateRequest({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.ownerType,
    this.taxNumber,
    this.identityNumber,
    required this.address,
    required this.country,
    required this.city,
    this.dateOfBirth,
    this.companyName,
  });

  /// Converts [WalletOwnerCreateRequest] to JSON
  Map<String, dynamic> toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "OwnerType": ownerType,
      "TaxNumber": taxNumber,
      "IdentityNumber": identityNumber,
      "Address": address,
      "Country": country,
      "City": city,
      "DateOfBirth": dateOfBirth,
      "CompanyName": companyName,
    };
  }
}
