part of 'intro_cubit.dart';

@immutable
abstract class IntroState extends Equatable {
  const IntroState();
  @override
  List<Object> get props => [];
}

final class IntroPageChanged extends IntroState {
  final int pageIndex;
  const IntroPageChanged({required this.pageIndex});
}

final class IntroLoadingState extends IntroState {}

final class IntroErrorState extends IntroState {
  final String message;
  const IntroErrorState({required this.message});
}

final class IntroLoadedState extends IntroState {
  final List<IntroPage> introPage;
  final int currentIndex;
  const IntroLoadedState({required this.introPage, required this.currentIndex});
  @override
  List<Object> get props => [introPage, currentIndex];
}
