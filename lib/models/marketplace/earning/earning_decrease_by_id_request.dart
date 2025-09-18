/// Request model for decreasing an earning by Id.
class EarningDecreaseByIdRequest {
  final int id;
  final double earning;

  EarningDecreaseByIdRequest({required this.id, required this.earning});

  Map<String, dynamic> toJson() {
    return {'Id': id, 'Earning': earning};
  }
}
