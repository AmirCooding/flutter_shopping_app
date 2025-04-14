import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String cartScreen = '/cart_screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Text('Cart Screen'),
      ),
    );
  }
}
