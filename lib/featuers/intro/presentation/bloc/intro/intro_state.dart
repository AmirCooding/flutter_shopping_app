part of 'intro_cubit.dart';

@immutable
abstract class IntroState extends Equatable {
  final int pageIndex;
  const IntroState({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}

final class IntroInitial extends IntroState {
  const IntroInitial() : super(pageIndex: 0);
}

final class IntroPageChanged extends IntroState {
  const IntroPageChanged(int pageIndex) : super(pageIndex: pageIndex);
}
