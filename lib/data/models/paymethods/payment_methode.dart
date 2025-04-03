import 'package:ustore/data/models/paymethods/creadit_cart_payment.dart';
import 'package:ustore/data/models/paymethods/direct_transfer_methode.dart';
import 'package:ustore/data/models/paymethods/pay_pal_method.dart';

abstract class PaymentMethod {
  String get method;
  Map<String, dynamic> toJson();

  static PaymentMethod fromJson(Map<String, dynamic> json) {
    switch (json['method']) {
      case 'credit_card':
        return CreditCardPayment.fromJson(json);
      case 'paypal':
        return PaypalPayment.fromJson(json);
      case 'direct_transfer':
        return DirectTransfer.fromJson(json);
      default:
        throw Exception('Unbekannte Zahlungsmethode: ${json['method']}');
    }
  }
}
