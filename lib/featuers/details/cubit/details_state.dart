part of 'details_cubit.dart';

class DetailsState {
  final DetailsDataStatus status;
  final bool isFavorite;

  DetailsState({required this.status, required this.isFavorite});

  DetailsState copyWith({DetailsDataStatus? status, bool? isFavorite}) {
    return DetailsState(
      status: status ?? this.status,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
