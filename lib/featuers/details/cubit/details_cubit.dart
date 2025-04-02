import 'package:bloc/bloc.dart';
import 'package:ustore/featuers/details/usecase/details_usecase.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final DetailsUsecase detailsUsecase;
  DetailsCubit(this.detailsUsecase) : super(DetailsInitial());
}
