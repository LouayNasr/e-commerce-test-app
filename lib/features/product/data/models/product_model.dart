import '../../domain/entities/product.dart';
import 'rating_model.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.image,
    required super.category,
    required super.description,
    required super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      category: json['category'],
      description: json['description'] ?? '',
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}