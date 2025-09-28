class ActiveCampaignsListData {
  final List<ActiveCampaignItem> items;
  final int pageNumber;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  ActiveCampaignsListData({
    required this.items,
    required this.pageNumber,
    required this.totalPages,
    required this.totalCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory ActiveCampaignsListData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json["Items"];
    final parsedItems = (itemsJson as List<dynamic>?)?.map((e) => ActiveCampaignItem.fromJson(e as Map<String, dynamic>)).toList() ?? [];

    return ActiveCampaignsListData(
      items: parsedItems,
      pageNumber: (json["PageNumber"] as num?)?.toInt() ?? 0,
      totalPages: (json["TotalPages"] as num?)?.toInt() ?? 0,
      totalCount: (json["TotalCount"] as num?)?.toInt() ?? 0,
      hasPreviousPage: (json["HasPreviousPage"] as bool?) ?? false,
      hasNextPage: (json["HasNextPage"] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Items": items.map((e) => e.toJson()).toList(),
      "PageNumber": pageNumber,
      "TotalPages": totalPages,
      "TotalCount": totalCount,
      "HasPreviousPage": hasPreviousPage,
      "HasNextPage": hasNextPage,
    };
  }
}

class ActiveCampaignItem {
  final String id;
  final String name;
  final String description;
  final double minimumDepositAmount;
  final double maximumDepositAmount;
  final String bonusType;
  final double bonusValue;
  final String campaignType;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isActive;
  final double totalBonusGiven;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ActiveCampaignItem({
    required this.id,
    required this.name,
    required this.description,
    required this.minimumDepositAmount,
    required this.maximumDepositAmount,
    required this.bonusType,
    required this.bonusValue,
    required this.campaignType,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.totalBonusGiven,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ActiveCampaignItem.fromJson(Map<String, dynamic> json) {
    return ActiveCampaignItem(
      id: json["Id"] as String? ?? "",
      name: json["Name"] as String? ?? "",
      description: json["Description"] as String? ?? "",
      minimumDepositAmount: (json["MinimumDepositAmount"] as num?)?.toDouble() ?? 0,
      maximumDepositAmount: (json["MaximumDepositAmount"] as num?)?.toDouble() ?? 0,
      bonusType: json["BonusType"] as String? ?? "",
      bonusValue: (json["BonusValue"] as num?)?.toDouble() ?? 0,
      campaignType: json["CampaignType"] as String? ?? "",
      startDate: json["StartDate"] != null ? DateTime.tryParse(json["StartDate"]) : null,
      endDate: json["EndDate"] != null ? DateTime.tryParse(json["EndDate"]) : null,
      isActive: (json["IsActive"] as bool?) ?? false,
      totalBonusGiven: (json["TotalBonusGiven"] as num?)?.toDouble() ?? 0,
      createdAt: json["CreatedAt"] != null ? DateTime.tryParse(json["CreatedAt"]) : null,
      updatedAt: json["UpdatedAt"] != null ? DateTime.tryParse(json["UpdatedAt"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Id": id,
      "Name": name,
      "Description": description,
      "MinimumDepositAmount": minimumDepositAmount,
      "MaximumDepositAmount": maximumDepositAmount,
      "BonusType": bonusType,
      "BonusValue": bonusValue,
      "CampaignType": campaignType,
      "StartDate": startDate?.toIso8601String(),
      "EndDate": endDate?.toIso8601String(),
      "IsActive": isActive,
      "TotalBonusGiven": totalBonusGiven,
      "CreatedAt": createdAt?.toIso8601String(),
      "UpdatedAt": updatedAt?.toIso8601String(),
    };
  }
}
