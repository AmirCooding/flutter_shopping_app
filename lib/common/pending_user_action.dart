import 'package:ustore/data/models/product.dart';

enum PendingActionType { addToFavorites, addToCart, goToProfile, none }

class PendingUserAction {
  final PendingActionType actionType;
  final Product product;

  PendingUserAction({required this.actionType, required this.product});
}
