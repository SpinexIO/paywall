class UpdateLimitRequest {
  final String id;
  final double value;

  UpdateLimitRequest({required this.id, required this.value});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"Id": id, "Value": value};
  }
}
