/// Request model for postponing an earning by Id.
class EarningPostponeByIdRequest {
  final int id;
  final int day;

  EarningPostponeByIdRequest({required this.id, required this.day});

  Map<String, dynamic> toJson() {
    return {'Id': id, 'Day': day};
  }
}
