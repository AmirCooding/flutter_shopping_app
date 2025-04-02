import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final String id;
  final int productId;
  final String userId;

  const Favorite(
      {required this.id, required this.productId, required this.userId});

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
        id: json['id'], productId: json['productId'], userId: json['userId']);
  }
  @override
  List<Object?> get props => [id, productId, userId];
}
