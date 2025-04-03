class AppUser {
  final String uid;
  final String email;
  final String password;

  AppUser({required this.uid, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'email': email,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}
