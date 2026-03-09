import '../entities/cart_item.dart';

abstract class CartRepository {
  List<CartItem> getCartItems();

  void addToCart(CartItem item);

  void removeFromCart(int productId);

  void increaseQuantity(int productId);

  void decreaseQuantity(int productId);

  void clearCart();

  Future<void> checkout();
}