import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/custom_app.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/featuers/details/cubit/details_cubit.dart';
import 'package:ustore/locator.dart';
import 'package:ustore/utils/widgets/custom_button.dart';
import 'package:ustore/utils/widgets/product_rating_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  static var detailsScreen = '/details_screen';

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
    ));
    final locale = LanguageManager().locale;
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final String title = locale == 'de' ? "Produktdetails" : "Product Details";

    return BlocProvider(
      create: (context) => DetailsCubit(locator()),
      child: Scaffold(
        appBar: CustomAppBar(title: title, icon: Icon(CupertinoIcons.share)),
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.textWhite,
                    ),
                    height: 300,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        product.image!,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Product Title & Favorite Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.title ?? "No Title",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //TODO: Implement Favorite Button
                      /*
                      IconButton(
                        icon: Icon(
                          
                          state.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: state.isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          context
                              .read<DetailsCubit>()
                              .toggleFavorite(product.id);
                        },
                      ),*/
                    ],
                  ),

                  // Category
                  Text(
                    "Category: ${product.category}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Price
                  Row(
                    children: [
                      Text(
                        '${(product.price! - product.price! * 0.2).toStringAsFixed(2)}€',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${(product.price!).toStringAsFixed(2)}€',
                        style: const TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description
                  const Text("Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    reviewCountTextStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Add to Cart Button
                  CustomButton(
                    text: "Add to Cart",
                    textColor: Colors.white,
                    backgroundColor: isDarkMode
                        ? AppColors.secondaryDark
                        : AppColors.secondary,
                    icon: Icons.shopping_cart,
                    onPressed: () {
                      // context.read<DetailsCubit>().addToCart(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added Product to Cart!")),
                      );
                    },
                  ),
                  SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
