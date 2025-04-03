import 'package:ustore/data/models/paymethods/payment_methode.dart';

class DirectTransfer extends PaymentMethod {
  final String accountNumber;
  final String bankName;

  DirectTransfer({required this.accountNumber, required this.bankName});

  @override
  String get method => 'Direct Transfer';
}
