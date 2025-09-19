/// Wallet owner list data containing pagination info and items.
/// Hint: Contains metadata like total pages, count and actual list of owners.
class WalletOwnerListData {
  final List<WalletOwnerItem> items;
  final int pageNumber;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  WalletOwnerListData({
    required this.items,
    required this.pageNumber,
    required this.totalPages,
    required this.totalCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory WalletOwnerListData.fromJson(Map<String, dynamic> json) {
    return WalletOwnerListData(
      items: (json['Items'] as List<dynamic>)
          .map((e) => WalletOwnerItem.fromJson(e))
          .toList(),
      pageNumber: json['PageNumber'] ?? 0,
      totalPages: json['TotalPages'] ?? 0,
      totalCount: json['TotalCount'] ?? 0,
      hasPreviousPage: json['HasPreviousPage'] ?? false,
      hasNextPage: json['HasNextPage'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Items': items.map((e) => e.toJson()).toList(),
      'PageNumber': pageNumber,
      'TotalPages': totalPages,
      'TotalCount': totalCount,
      'HasPreviousPage': hasPreviousPage,
      'HasNextPage': hasNextPage,
    };
  }
}

/// Wallet Owner Item model
/// Hint: Represents each wallet owner entry.
class WalletOwnerItem {
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

  WalletOwnerItem({
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

  factory WalletOwnerItem.fromJson(Map<String, dynamic> json) {
    return WalletOwnerItem(
      id: json['Id'],
      fullname: json['Fullname'],
      email: json['Email'],
      phoneNumber: json['PhoneNumber'],
      taxNumber: json['TaxNumber'],
      identityNumber: json['IdentityNumber'],
      ownerType: json['OwnerType'],
      companyName: json['CompanyName'],
      address: json['Address'],
      country: json['Country'],
      city: json['City'],
      dateOfBirth: json['DateOfBirth'],
      createdAt: json['CreatedAt'],
      updatedAt: json['UpdatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Fullname': fullname,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'TaxNumber': taxNumber,
      'IdentityNumber': identityNumber,
      'OwnerType': ownerType,
      'CompanyName': companyName,
      'Address': address,
      'Country': country,
      'City': city,
      'DateOfBirth': dateOfBirth,
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt,
    };
  }
}
