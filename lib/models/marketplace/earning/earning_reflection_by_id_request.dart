/// Request model for updating earning reflection date by Id.
class EarningReflectionByIdRequest {
  final int id;
  final DateTime reflectionDate;

  EarningReflectionByIdRequest({required this.id, required this.reflectionDate});

  Map<String, dynamic> toJson() {
    return {'Id': id, 'ReflectionDate': reflectionDate.toIso8601String()};
  }
}
