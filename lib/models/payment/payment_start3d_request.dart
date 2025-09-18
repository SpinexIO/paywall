

import 'package:paywall/models/payment/payment_start_request.dart';

/// Request model for starting a 3D Secure payment.
class PaymentStart3DRequest {
  final PaymentDetail paymentDetail;
  final Card card;
  final Customer customer;
  final List<Product> products;

  PaymentStart3DRequest({required this.paymentDetail, required this.card, required this.customer, required this.products});

  Map<String, dynamic> toJson() {
    return {
      "PaymentDetail": paymentDetail.toJson(),
      "Card": card.toJson(),
      "Customer": customer.toJson(),
      "Products": products.map((e) => e.toJson()).toList(),
    };
  }
}
