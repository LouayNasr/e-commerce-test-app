import 'package:flutter/material.dart';
import 'package:fsit_test/core/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../features/Cart/presentation/controllers/cart_controller.dart';


class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Obx(() {
      final count = controller.cartItems.length;

      return Stack(
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Get.toNamed(AppRoutes.cart);
            },
          ),

          if (count > 0)
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}
