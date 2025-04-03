import 'package:ustore/data/models/paymethods/payment_methode.dart';

class PaypalPayment extends PaymentMethod {
  final String paypalEmail;

  PaypalPayment({required this.paypalEmail});

  @override
  String get method => 'PayPal';

  PaypalPayment copyWith({String? paypalEmail}) {
    return PaypalPayment(
      paypalEmail: paypalEmail ?? this.paypalEmail,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paypalEmail': paypalEmail,
    };
  }

  factory PaypalPayment.fromJson(Map<String, dynamic> json) {
    return PaypalPayment(
      paypalEmail: json['paypalEmail'] as String,
    );
  }
}
