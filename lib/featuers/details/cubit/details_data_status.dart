abstract class DetailsDataStatus {}

class DetailsDataInitial extends DetailsDataStatus {}

class DetailsDataLoading extends DetailsDataStatus {}

class AddProductToFavoritesSuccess extends DetailsDataStatus {}

class RemoveProductFromFavoritesSuccess extends DetailsDataStatus {}

class DetailsDataError extends DetailsDataStatus {
  final String error;
  DetailsDataError(this.error);
}
