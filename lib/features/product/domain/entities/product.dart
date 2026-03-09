import 'package:equatable/equatable.dart';

import 'rating.dart';

class Product extends Equatable  {
  final int id;
  final String title;
  final double price;
  final String image;
  final String category;
  final String description;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
    required this.rating,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    category,
    image,
  ];
}