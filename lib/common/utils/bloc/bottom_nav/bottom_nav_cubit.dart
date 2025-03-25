import 'package:bloc/bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);
  changeSelectedIndex(int newindex) => emit(newindex);
}
