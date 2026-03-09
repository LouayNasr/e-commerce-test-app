import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final int id;
  final String title;
  final double price;
  final String image;
  final String description;
  final String category;
  final int quantity;

  const CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    required this.quantity,
  });

  CartItem copyWith({
    int? quantity,
  }) {
    return CartItem(
      id: id,
      title: title,
      price: price,
      image: image,
      description: description,
      category: category,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
    };
  }

  double get totalPrice => price * quantity;

  @override
  List<Object?> get props =>
      [id, title, price, image, description, category, quantity];
}