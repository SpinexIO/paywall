/// Request model for increasing an earning by Id.
class EarningIncreaseByIdRequest {
  final int id;
  final double earning;

  EarningIncreaseByIdRequest({required this.id, required this.earning});

  Map<String, dynamic> toJson() {
    return {'Id': id, 'Earning': earning};
  }
}
