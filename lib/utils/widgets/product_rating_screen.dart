import 'package:flutter/material.dart';

class ProductRatingScreen extends StatelessWidget {
  final double rating;
  final int? reviewCount;
  final TextStyle ratingTextStyle;
  final TextStyle reviewCountTextStyle;

  const ProductRatingScreen(
      {super.key,
      required this.rating,
      this.reviewCount,
      required this.ratingTextStyle,
      required this.reviewCountTextStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating.round() ? Icons.star : Icons.star_border,
                    color: index < rating.round() ? Colors.yellow : Colors.grey,
                    size: 20,
                  );
                }),
              ),
              const SizedBox(width: 5),
              Text(
                "(${rating.toStringAsFixed(1)})",
                style: ratingTextStyle.copyWith(color: Colors.grey[700]),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            reviewCount != null ? "($reviewCount reviews)" : "(No reviews)",
            style: reviewCountTextStyle.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
