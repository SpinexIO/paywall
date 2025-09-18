/// Customer model
class Customer {
  final int type;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? companyName;
  final String? taxOfficeCode;
  final String? taxNumber;
  final String? phone;
  final String? email;
  final String? identity;
  final String? country;
  final String? city;
  final String? district;
  final String? neighborhood;
  final String? address;

  Customer({
    required this.type,
    this.firstName,
    this.middleName,
    this.lastName,
    this.companyName,
    this.taxOfficeCode,
    this.taxNumber,
    this.phone,
    this.email,
    this.identity,
    this.country,
    this.city,
    this.district,
    this.neighborhood,
    this.address,
  });

  Map<String, dynamic> toJson() => {
    'Type': type,
    if (firstName != null) 'FirstName': firstName,
    if (middleName != null) 'MiddleName': middleName,
    if (lastName != null) 'LastName': lastName,
    if (companyName != null) 'CompanyName': companyName,
    if (taxOfficeCode != null) 'TaxOfficeCode': taxOfficeCode,
    if (taxNumber != null) 'TaxNumber': taxNumber,
    if (phone != null) 'Phone': phone,
    if (email != null) 'Email': email,
    if (identity != null) 'Identity': identity,
    if (country != null) 'Country': country,
    if (city != null) 'City': city,
    if (district != null) 'District': district,
    if (neighborhood != null) 'Neighborhood': neighborhood,
    if (address != null) 'Address': address,
  };

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      type: json['Type'],
      firstName: json['FirstName'],
      middleName: json['MiddleName'],
      lastName: json['LastName'],
      companyName: json['CompanyName'],
      taxOfficeCode: json['TaxOfficeCode'],
      taxNumber: json['TaxNumber'],
      phone: json['Phone'],
      email: json['Email'],
      identity: json['Identity'],
      country: json['Country'],
      city: json['City'],
      district: json['District'],
      neighborhood: json['Neighborhood'],
      address: json['Address'],
    );
  }
}
