import 'package:flutter/material.dart';
import 'package:ustore/data/models/product.dart';

@immutable
abstract class HomeDataStatus {}

class HomeDataLoading extends HomeDataStatus {}

class HomeDataLoaded extends HomeDataStatus {
  final List<Product> data;

  HomeDataLoaded({required this.data});
}

class HomeDataBanerImagesLoaded extends HomeDataStatus {}

class HomeDataError extends HomeDataStatus {
  final String message;

  HomeDataError({required this.message});
}
