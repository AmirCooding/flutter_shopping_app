part of 'intro_cubit.dart';

@immutable
abstract class IntroState extends Equatable {
  const IntroState();

  @override
  List<Object> get props => [];
}

final class IntroLoading extends IntroState {}

final class IntroSuccessLoaded extends IntroState {
  final List<IntroPage> introPages;
  const IntroSuccessLoaded(this.introPages);
  @override
  List<Object> get props => [introPages];
}

final class IntroError extends IntroState {
  final String message;
  const IntroError(this.message);

  @override
  List<Object> get props => [message];
}
