import 'package:equatable/equatable.dart';

class IntroLocalization extends Equatable {
  final String title1;
  final String title2;
  final String title3;
  final String description1;
  final String description2;
  final String description3;

  const IntroLocalization({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.description1,
    required this.description2,
    required this.description3,
  });

  @override
  List<Object> get props =>
      [title1, title2, title3, description1, description2, description3];

  factory IntroLocalization.fromJson(Map<String, dynamic> json) {
    return IntroLocalization(
      title1: json['title1'] as String,
      title2: json['title2'] as String,
      title3: json['title3'] as String,
      description1: json['description1'] as String,
      description2: json['description2'] as String,
      description3: json['description3'] as String,
    );
  }
}
