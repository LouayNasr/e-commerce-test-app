import 'package:get/get.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';

enum CheckoutState { idle, loading }

class CartController extends GetxController {
  final CartRepository repository;

  CartController(this.repository);

  final cartItems = <CartItem>[].obs;

  final checkoutState = CheckoutState.idle.obs;

  @override
  void onInit() {
    cartItems.value = List.from(repository.getCartItems());
    super.onInit();
  }

  void addToCart(CartItem item) {
    repository.addToCart(item);
    cartItems.value = List.from(repository.getCartItems());
  }

  void removeFromCart(int id) {
    repository.removeFromCart(id);
    cartItems.value = List.from(repository.getCartItems());
  }

  void increase(int id) {
    repository.increaseQuantity(id);
    cartItems.value = List.from(repository.getCartItems());
  }

  void decrease(int id) {
    repository.decreaseQuantity(id);
    cartItems.value = List.from(repository.getCartItems());
  }

  Future<void> checkout() async {
    try {
      checkoutState.value = CheckoutState.loading;

      await repository.checkout();

      repository.clearCart();
      cartItems.clear();

      checkoutState.value = CheckoutState.idle;

      Get.snackbar("Success", "Order placed successfully");
    } catch (e) {
      checkoutState.value = CheckoutState.idle;

      Get.snackbar("Error", "Checkout failed");
    }
  }

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  double get tax => subtotal * 0.05;

  double get total => subtotal + tax;
}