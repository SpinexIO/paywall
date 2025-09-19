class CampaignByNameListData {
  final List<CampaignByNameItem> items;

  CampaignByNameListData({required this.items});

  factory CampaignByNameListData.fromJson(dynamic json) {
    if (json is List) {
      final parsedItems = json.map((e) => CampaignByNameItem.fromJson(e as Map<String, dynamic>)).toList();
      return CampaignByNameListData(items: parsedItems);
    } else {
      return CampaignByNameListData(items: []);
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"Items": items.map((e) => e.toJson()).toList()};
  }
}

class CampaignByNameItem {
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
  final String? merchantId;
  final double totalBonusGiven;
  final int regionId;
  final String currencyCode;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CampaignByNameItem({
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
    required this.merchantId,
    required this.totalBonusGiven,
    required this.regionId,
    required this.currencyCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CampaignByNameItem.fromJson(Map<String, dynamic> json) {
    return CampaignByNameItem(
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
      merchantId: json["MerchantId"] as String?,
      totalBonusGiven: (json["TotalBonusGiven"] as num?)?.toDouble() ?? 0,
      regionId: (json["RegionId"] as num?)?.toInt() ?? 0,
      currencyCode: json["CurrencyCode"] as String? ?? "",
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
      "MerchantId": merchantId,
      "TotalBonusGiven": totalBonusGiven,
      "RegionId": regionId,
      "CurrencyCode": currencyCode,
      "CreatedAt": createdAt?.toIso8601String(),
      "UpdatedAt": updatedAt?.toIso8601String(),
    };
  }
}
