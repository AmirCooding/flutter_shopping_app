import 'package:uuid/uuid.dart';

class AppUser {
  final String uid = const Uuid().v4();
  final String email;
  final String password;

  AppUser({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'email': email,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      email: json['email'],
      password: json['password'],
    );
  }
}
