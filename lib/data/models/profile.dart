import 'package:equatable/equatable.dart';
import 'package:ustore/data/models/address.dart';

class Profile extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final String? phone;
  final String? image;
  final Address? address;
  final PaymentMethode? paymentMethode;

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PaymentMethode extends Equatable {}
