class LimitResponse {
  final String id;
  final String scope;
  final String limitType;
  final String limitCategory;
  final String limitApproach;
  final double value;
  final String? currencyId;
  final String currencyCode;
  final DateTime createdAt;
  final DateTime? updatedAt;

  LimitResponse({
    required this.id,
    required this.scope,
    required this.limitType,
    required this.limitCategory,
    required this.limitApproach,
    required this.value,
    this.currencyId,
    required this.currencyCode,
    required this.createdAt,
    this.updatedAt,
  });

  factory LimitResponse.fromJson(Map<String, dynamic> json) {
    return LimitResponse(
      id: json['Id'],
      scope: json['Scope'],
      limitType: json['LimitType'],
      limitCategory: json['LimitCategory'],
      limitApproach: json['LimitApproach'],
      value: (json['Value'] as num).toDouble(),
      currencyId: json['CurrencyId'],
      currencyCode: json['CurrencyCode'],
      createdAt: DateTime.parse(json['CreatedAt']),
      updatedAt: json['UpdatedAt'] != null ? DateTime.parse(json['UpdatedAt']) : null,
    );
  }
}
