import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remote;

  CartRepositoryImpl(this.remote);

  final List<CartItem> _cart = [];

  @override
  List<CartItem> getCartItems() => _cart;

  @override
  void addToCart(CartItem item) {
    final index = _cart.indexWhere((e) => e.id == item.id);

    if (index != -1) {
      _cart[index] =
          _cart[index].copyWith(quantity: _cart[index].quantity + 1);
    } else {
      _cart.add(item);
    }
  }

  @override
  void removeFromCart(int productId) {
    _cart.removeWhere((e) => e.id == productId);
  }

  @override
  void increaseQuantity(int productId) {
    final index = _cart.indexWhere((e) => e.id == productId);

    if (index != -1) {
      _cart[index] =
          _cart[index].copyWith(quantity: _cart[index].quantity + 1);
    }
  }

  @override
  void decreaseQuantity(int productId) {
    final index = _cart.indexWhere((e) => e.id == productId);

    if (index != -1 && _cart[index].quantity > 1) {
      _cart[index] =
          _cart[index].copyWith(quantity: _cart[index].quantity - 1);
    }
  }

  @override
  void clearCart() {
    _cart.clear();
  }

  @override
  Future<void> checkout() async {
    await remote.checkout(_cart);
  }
}