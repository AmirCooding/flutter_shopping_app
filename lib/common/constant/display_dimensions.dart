import 'package:flutter/material.dart';

double screenWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}

double screenHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}
