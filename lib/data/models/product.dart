import 'package:equatable/equatable.dart';
import 'package:ustore/data/models/rating.dart';

class Product extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  const Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});
  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = (json['price'] is int)
            ? (json['price'] as int).toDouble()
            : json['price'],
        description = json['description'],
        category = json['category'],
        image = json['image'],
        rating =
            json['rating'] != null ? Rating.fromJson(json['rating']) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];
}
