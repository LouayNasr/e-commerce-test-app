import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products_controller.dart';
import '../widgets/product_card.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(controller.errorMessage.value),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final product = controller.products[index];

            return ProductCard(
              product: product,
              onTap: () {
                Get.toNamed('/product-details', arguments: product.id);
              },
            );
          },
        );
      }),
    );
  }
}