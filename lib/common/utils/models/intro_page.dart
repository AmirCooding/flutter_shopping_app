import 'package:equatable/equatable.dart';
import 'package:ustore/common/utils/models/intro_localization.dart';

class IntroPage extends Equatable {
  final String image;
  final IntroLocalization introLocalization;

  IntroPage({required this.image, required this.introLocalization});

  @override
  List<Object?> get props => [image, introLocalization];
}
