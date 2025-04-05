import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final String id;
  final int productId;
  final String userId;
  final int quantity;

  const Cart(
      {required this.id,
      required this.productId,
      required this.userId,
      required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'userId': userId,
      'quantity': quantity,
    };
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        id: json['id'],
        productId: json['productId'],
        userId: json['userId'],
        quantity: json['quantity']);
  }

  Cart copyWith({String? id, int? productId, String? userId, int? quantity}) {
    return Cart(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        userId: userId ?? this.userId,
        quantity: quantity ?? this.quantity);
  }

  @override
  List<Object?> get props => [id, productId, userId, quantity];
}
