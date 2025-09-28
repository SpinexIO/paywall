class UpdateCommissionRequest {
  final String id;
  final String feeType;
  final double feeValue;

  UpdateCommissionRequest({required this.id, required this.feeType, required this.feeValue});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"Id": id, "FeeType": feeType, "FeeValue": feeValue};
  }
}
