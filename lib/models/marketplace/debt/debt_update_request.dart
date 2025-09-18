/// Request model for increasing or decreasing a debt by Id
class DebtUpdateRequest {
  final int id;
  final double debt;

  DebtUpdateRequest({required this.id, required this.debt});

  /// Converts object to JSON map
  Map<String, dynamic> toJson() {
    return {'Id': id, 'Debt': debt};
  }

  /// Creates an object from JSON map
  factory DebtUpdateRequest.fromJson(Map<String, dynamic> json) {
    return DebtUpdateRequest(id: json['Id'] as int, debt: (json['Debt'] as num).toDouble());
  }
}
