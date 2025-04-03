import 'package:equatable/equatable.dart';
import 'package:ustore/data/models/address.dart';
import 'package:ustore/data/models/app_user.dart';
import 'package:ustore/data/models/paymethods/payment_methode.dart';

class Profile extends Equatable {
  final String uid;
  final String fullName;
  final AppUser user;
  final String? phone;
  final String? image;
  final Address? address;
  final PaymentMethod? paymentMethod;

  const Profile(
      {required this.uid,
      required this.fullName,
      required this.user,
      required this.phone,
      required this.image,
      required this.address,
      required this.paymentMethod});

  Profile copyWith({
    String? uid,
    String? fullName,
    AppUser? user,
    String? phone,
    String? image,
    Address? address,
    PaymentMethod? paymentMethod,
  }) {
    return Profile(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      user: user ?? this.user,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      address: address ?? this.address,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fullName': fullName,
      'user': user.toJson(),
      'phone': phone,
      'image': image,
      'address': address?.toJson(),
      'paymentMethod': paymentMethod?.toJson(),
    };
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      uid: json['uid'] as String,
      fullName: json['fullName'] as String,
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      address: json['address'] != null
          ? Address.fromJson(json['address'] as Map<String, dynamic>)
          : null,
      paymentMethod:
          PaymentMethod.fromJson(json['paymentMethod'] as Map<String, dynamic>),
    );
  }
  @override
  List<Object?> get props => throw UnimplementedError();
}
