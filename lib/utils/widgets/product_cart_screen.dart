import 'package:flutter/material.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';
import 'package:ustore/data/models/product.dart';

class ProductCartScreen extends StatelessWidget {
  static const productCart = '/product-cart-screen';
  final Product product;
  const ProductCartScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 275,
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.greyLight,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              product.image!,
              height: 150,
              width: 100,
              fit: BoxFit.cover,
            ),
            Text(
              product.title!,
              style: AppFont.darkHeading,
            ),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
