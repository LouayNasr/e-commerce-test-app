import 'package:flutter/material.dart';
import 'package:fsit_test/features/Product/presentation/controllers/products_controller.dart';
import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/entities/rating.dart';
import '../../domain/usecases/add_product_usecase.dart';

class AddProductController extends GetxController {
  final AddProductUseCase addProductUseCase;

  AddProductController(this.addProductUseCase);

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final imageController = TextEditingController();

  final isLoading = false.obs;

  Future<void> createProduct() async {
    try {
      isLoading.value = true;

      final product = Product(
        id: 0,
        title: titleController.text.trim(),
        price: double.parse(priceController.text),
        description: descriptionController.text.trim(),
        category: categoryController.text.trim(),
        image: imageController.text.trim(),
        rating: Rating.empty(),
      );

      await addProductUseCase(product);

      final productsController = Get.find<ProductsController>();
      await productsController.fetchProducts();
      Get.back();

      Get.snackbar(
        "Success",
        "Product added successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to add product",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
