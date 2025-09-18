/// Request model for adding or updating value date (valör) and commission settings of a member.
class ValueDateAddRequest {
  final int memberId;
  final int calculationType;
  final int calculationValue;
  final double commission;

  ValueDateAddRequest({required this.memberId, required this.calculationType, required this.calculationValue, required this.commission});

  Map<String, dynamic> toJson() {
    return {"MemberId": memberId, "CalculationType": calculationType, "CalculationValue": calculationValue, "Commission": commission};
  }
}
