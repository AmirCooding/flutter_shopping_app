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
    final isFavoite = false;
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return GestureDetector(
      onDoubleTap: () {
        Navigator.pushNamed(context, '/details_screen', arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 2.5, right: 2.5),
        child: Center(
          child: Container(
            height: 275,
            width: 170,
            decoration: BoxDecoration(
              color: AppColors.textWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.greyLight,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      product.image!,
                      height: 145,
                      fit: BoxFit.fill,
                    ),
                  ),
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
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => debugPrint('Add to favor(ite'),
                        child: isFavoite == false
                            ? Icon(CupertinoIcons.heart_circle,
                                color: AppColors.grey)
                            : Icon(CupertinoIcons.heart_circle_fill,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${product.price!}€',
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
                            '${(product.price! - product.price! * 0.2).toStringAsFixed(2)}€',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              color: isDarkMode
                                  ? AppColors.secondary
                                  : AppColors.secondaryDark,
                              fontSize: 18,
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
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
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
      ),
    );
  }
}
