import 'package:equatable/equatable.dart';

class IntroLocalization extends Equatable {
  final String title;
  final String description;
  const IntroLocalization(this.title, this.description);

  @override
  List<Object> get props => [title, description];
  factory IntroLocalization.fromJson(Map<String, dynamic> json) {
    return IntroLocalization(
      json['title'] as String,
      json['description'] as String,
    );
  }
}
