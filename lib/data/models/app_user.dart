import 'package:uuid/uuid.dart';

class AppUser {
  final String uid;
  final String email;
  final String password;
  final String? token;
  AppUser({
    String? uid,
    required this.email,
    required this.password,
    this.token,
  }) : uid = uid ?? const Uuid().v4();

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'email': email,
      'token': token,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['id'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }
}
