/// Request model for retrying an earning by Id.
class EarningRetryByIdRequest {
  final int id;
  final bool? changeReflectionDate;
  final DateTime? reflectionDate;

  EarningRetryByIdRequest({required this.id, this.changeReflectionDate, this.reflectionDate});

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      if (changeReflectionDate != null) 'ChangeReflectionDate': changeReflectionDate,
      if (reflectionDate != null) 'ReflectionDate': reflectionDate!.toIso8601String(),
    };
  }
}
