import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/featuers/details/cubit/details_cubit.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/featuers/auth/presentation/screens/sign_in_screen.dart';
import 'package:ustore/featuers/details/cubit/details_data_status.dart';
import 'package:ustore/utils/widgets/custom_button.dart';
import 'package:ustore/utils/widgets/custom_snakbar.dart';
import 'package:ustore/utils/widgets/product_rating_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String detailsScreen = '/details_screen';

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {
          if (state.status is DetailsDataError) {
            final error = (state.status as DetailsDataError).error;
            /*
            if (error.contains("You need to login first")) {
              Navigator.pushNamed(context, SignInScreen.signIn);
            }
            */
            CustomSnakbar.showSnackError(context, error);
          }
        },
        builder: (context, state) {
          final isFavorite = state.isFavorite;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Image.network(
                  product.image ?? '',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),

                // Title
                Text(
                  product.title ?? "No Title",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Category and Price
                Text("Category: ${product.category}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(product.price! - product.price! * 0.2).toStringAsFixed(2)}€',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        context
                            .read<DetailsCubit>()
                            .checkLoginAndToggleFavorite(product, context);
                      },
                    ),
                  ],
                ),

                Text(
                  '${product.price!.toStringAsFixed(2)}€',
                  style: const TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),

                // Description
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  product.description ?? "No Description",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Rating
                ProductRatingScreen(
                  rating: product.rating?.rate ?? 0,
                  reviewCount: product.rating?.count ?? 0,
                  ratingTextStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  reviewCountTextStyle: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),

                // Add to Cart Button
                CustomButton(
                  text: "Add to Cart",
                  textColor: Colors.white,
                  backgroundColor: Colors.blue,
                  icon: Icons.shopping_cart,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added Product to Cart!")),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
