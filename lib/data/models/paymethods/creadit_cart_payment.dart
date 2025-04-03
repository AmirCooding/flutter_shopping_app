import 'package:ustore/data/models/paymethods/payment_methode.dart';

class CreditCardPayment extends PaymentMethod {
  final String cardNumber;
  final String cardHolder;
  final String expirationDate;
  final String cvv;

  CreditCardPayment({
    required this.cardNumber,
    required this.cardHolder,
    required this.expirationDate,
    required this.cvv,
  });

  @override
  String get method => 'Credit Card';

  copyWith({
    String? cardNumber,
    String? cardHolder,
    String? expirationDate,
    String? cvv,
  }) {
    return CreditCardPayment(
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolder: cardHolder ?? this.cardHolder,
      expirationDate: expirationDate ?? this.expirationDate,
      cvv: cvv ?? this.cvv,
    );
  }

  toJson() {
    return {
      'cardNumber': cardNumber,
      'cardHolder': cardHolder,
      'expirationDate': expirationDate,
      'cvv': cvv,
    };
  }

  factory CreditCardPayment.fromJson(Map<String, dynamic> json) {
    return CreditCardPayment(
      cardNumber: json['cardNumber'] as String,
      cardHolder: json['cardHolder'] as String,
      expirationDate: json['expirationDate'] as String,
      cvv: json['cvv'] as String,
    );
  }
}
