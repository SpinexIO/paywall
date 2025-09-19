/// Wallet Owner Create Response Data
/// Hint: Represents the wallet owner returned after successful creation.
class WalletOwnerCreateResponseData {
  final String id;
  final String fullname;
  final String email;
  final String phoneNumber;
  final String? taxNumber;
  final String? identityNumber;
  final String ownerType;
  final String? companyName;
  final String? address;
  final String? country;
  final String? city;
  final String? dateOfBirth;
  final String createdAt;
  final String? updatedAt;

  WalletOwnerCreateResponseData({
    required this.id,
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    this.taxNumber,
    this.identityNumber,
    required this.ownerType,
    this.companyName,
    this.address,
    this.country,
    this.city,
    this.dateOfBirth,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates [WalletOwnerCreateResponseData] from JSON
  factory WalletOwnerCreateResponseData.fromJson(Map<String, dynamic> json) {
    return WalletOwnerCreateResponseData(
      id: json['Id'] ?? '',
      fullname: json['Fullname'] ?? '',
      email: json['Email'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      taxNumber: json['TaxNumber'],
      identityNumber: json['IdentityNumber'],
      ownerType: json['OwnerType'] ?? '',
      companyName: json['CompanyName'],
      address: json['Address'],
      country: json['Country'],
      city: json['City'],
      dateOfBirth: json['DateOfBirth'],
      createdAt: json['CreatedAt'] ?? '',
      updatedAt: json['UpdatedAt'],
    );
  }

  /// Converts [WalletOwnerCreateResponseData] to JSON
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Fullname": fullname,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "TaxNumber": taxNumber,
      "IdentityNumber": identityNumber,
      "OwnerType": ownerType,
      "CompanyName": companyName,
      "Address": address,
      "Country": country,
      "City": city,
      "DateOfBirth": dateOfBirth,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
    };
  }
}
