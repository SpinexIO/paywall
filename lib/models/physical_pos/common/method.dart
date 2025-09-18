/// Payment Method model
class Method {
  final int paymentMethodId;

  Method({required this.paymentMethodId});

  Map<String, dynamic> toJson() => {'PaymentMethodId': paymentMethodId};

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(paymentMethodId: json['PaymentMethodId']);
  }
}
