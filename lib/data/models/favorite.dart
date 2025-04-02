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

  Favorite copyWith({String? id, int? productId, String? userId}) {
    return Favorite(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        userId: userId ?? this.userId);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'userId': userId,
    };
  }

  @override
  List<Object?> get props => [id, productId, userId];
}
