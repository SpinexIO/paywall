/// Response model for getting value date (valör) and commission settings of a member.
class ValueDateGetResponse {
  final int errorCode;
  final bool result;
  final String message;
  final ValueDateBody? body;

  ValueDateGetResponse({required this.errorCode, required this.result, required this.message, this.body});

  factory ValueDateGetResponse.fromJson(Map<String, dynamic> json) {
    return ValueDateGetResponse(
      errorCode: json['ErrorCode'],
      result: json['Result'],
      message: json['Message'] ?? '',
      body: json['Body'] != null ? ValueDateBody.fromJson(json['Body']) : null,
    );
  }
}

/// Body containing detailed value date and commission information.
class ValueDateBody {
  final int id;
  final int calculationType;
  final int calculationValue;
  final double commission;

  ValueDateBody({required this.id, required this.calculationType, required this.calculationValue, required this.commission});

  factory ValueDateBody.fromJson(Map<String, dynamic> json) {
    return ValueDateBody(
      id: json['Id'],
      calculationType: json['CalculationType'],
      calculationValue: json['CalculationValue'],
      commission: (json['Commission'] as num).toDouble(),
    );
  }
}
