/// Wallet Owner Identity Response Data
/// Hint: Represents the wallet owner data returned when searching by identity number.
class WalletOwnerIdentityResponseData {
  final String id;
  final String maskedFullname;
  final String email;
  final String phoneNumber;
  final String? maskedTaxNumber;
  final String? maskedIdentityNumber;
  final String ownerType;
  final String? companyName;
  final String? address;
  final String? country;
  final String? city;
  final String? dateOfBirth;
  final String createdAt;
  final String? updatedAt;
  final List<dynamic>? wallets; // For now as dynamic list (docs don’t detail structure)

  WalletOwnerIdentityResponseData({
    required this.id,
    required this.maskedFullname,
    required this.email,
    required this.phoneNumber,
    this.maskedTaxNumber,
    this.maskedIdentityNumber,
    required this.ownerType,
    this.companyName,
    this.address,
    this.country,
    this.city,
    this.dateOfBirth,
    required this.createdAt,
    this.updatedAt,
    this.wallets,
  });

  /// Creates [WalletOwnerIdentityResponseData] from JSON
  factory WalletOwnerIdentityResponseData.fromJson(Map<String, dynamic> json) {
    return WalletOwnerIdentityResponseData(
      id: json['Id'] ?? '',
      maskedFullname: json['MaskedFullname'] ?? '',
      email: json['Email'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      maskedTaxNumber: json['MaskedTaxNumber'],
      maskedIdentityNumber: json['MaskedIdentityNumber'],
      ownerType: json['OwnerType'] ?? '',
      companyName: json['CompanyName'],
      address: json['Address'],
      country: json['Country'],
      city: json['City'],
      dateOfBirth: json['DateOfBirth'],
      createdAt: json['CreatedAt'] ?? '',
      updatedAt: json['UpdatedAt'],
      wallets: json['Wallets'] != null ? List<dynamic>.from(json['Wallets']) : null,
    );
  }

  /// Converts [WalletOwnerIdentityResponseData] to JSON
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "MaskedFullname": maskedFullname,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "MaskedTaxNumber": maskedTaxNumber,
      "MaskedIdentityNumber": maskedIdentityNumber,
      "OwnerType": ownerType,
      "CompanyName": companyName,
      "Address": address,
      "Country": country,
      "City": city,
      "DateOfBirth": dateOfBirth,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
      "Wallets": wallets,
    };
  }
}
