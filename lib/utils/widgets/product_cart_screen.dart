import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/common/theme_helper.dart';

class ProductCartScreen extends StatelessWidget {
  static const productCart = '/product-cart-screen';
  final Product product;
  const ProductCartScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return GestureDetector(
      onDoubleTap: () {
        print('Navigiert to product detail');
      },
      child: Center(
        child: Container(
          height: 275,
          width: 170,
          decoration: BoxDecoration(
            color: AppColors.textWhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.grey,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    product.image!,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.title!,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.textBlack,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print('Add to favorite'),
                      child: Icon(CupertinoIcons.heart_fill,
                          color: Colors.deepOrangeAccent),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${product.description}',
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyDark,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${product.price}€',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyDark,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.greyDark,
                            decorationThickness: 1,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${product.price}€',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: isDarkMode
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.accentDark
                            : AppColors.accentLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 45,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint('Add to cart');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.zero, // Removes extra padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Matches Container's border radius
                          ),
                        ),
                        child: Center(
                          // Ensures the icon is centered
                          child: Icon(
                            CupertinoIcons.cart_badge_plus,
                            size: 35,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
