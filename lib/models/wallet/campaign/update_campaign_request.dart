class UpdateCampaignRequest {
  final String id;
  final String name;
  final String description;
  final double minimumDepositAmount;
  final double maximumDepositAmount;
  final String bonusType;
  final double bonusValue;
  final String campaignType;
  final DateTime startDate;
  final DateTime endDate;

  UpdateCampaignRequest({
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
  });

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
      "StartDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
      "EndDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    };
  }
}
