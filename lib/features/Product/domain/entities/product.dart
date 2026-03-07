import 'rating.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String category;
  final String description;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
    required this.rating,
  });
}