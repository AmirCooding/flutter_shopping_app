import 'package:ustore/data/models/paymethods/payment_methode.dart';

class DirectTransfer extends PaymentMethod {
  final String accountNumber;
  final String bankName;

  DirectTransfer({required this.accountNumber, required this.bankName});

  @override
  String get method => 'Direct Transfer';
  DirectTransfer copyWith({String? accountNumber, String? bankName}) {
    return DirectTransfer(
      accountNumber: accountNumber ?? this.accountNumber,
      bankName: bankName ?? this.bankName,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
      'bankName': bankName,
    };
  }

  factory DirectTransfer.fromJson(Map<String, dynamic> json) {
    return DirectTransfer(
      accountNumber: json['accountNumber'] as String,
      bankName: json['bankName'] as String,
    );
  }
}
