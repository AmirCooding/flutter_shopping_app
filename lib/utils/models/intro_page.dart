import 'package:equatable/equatable.dart';
import 'package:ustore/utils/models/intro_localization.dart';

class IntroPage extends Equatable {
  final String image;
  final IntroLocalization introLocalization;

  const IntroPage({required this.image, required this.introLocalization});

  @override
  List<Object?> get props => [image, introLocalization];

  factory IntroPage.fromJson(Map<String, dynamic> json) {
    return IntroPage(
      image: json['image'] ?? "",
      introLocalization: json['introlocalization'] != null
          ? IntroLocalization.fromJson(json['introlocalization'])
          : const IntroLocalization("No Title", "No Description"),
    );
  }
}
