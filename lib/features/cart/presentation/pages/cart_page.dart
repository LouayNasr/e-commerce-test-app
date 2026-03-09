import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/cart_summary.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff081c15),
      appBar: AppBar(
        title: const Text("Your cart"),
        backgroundColor: const Color(0xff081c15),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (_, index) {
                  return CartItemCard(
                    item: controller.cartItems[index],
                  );
                },
              ),
            ),
          ),

          const CartSummary(),
        ],
      ),
    );
  }
}