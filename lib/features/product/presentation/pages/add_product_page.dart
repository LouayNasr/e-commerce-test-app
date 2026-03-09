import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_product_controller.dart';

class AddProductPage extends GetView<AddProductController> {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [

              TextField(
                controller: controller.titleController,
                decoration: const InputDecoration(labelText: "Product Name"),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: controller.categoryController,
                decoration: const InputDecoration(labelText: "Category"),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Price"),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
              ),

              const SizedBox(height: 12),

              TextField(
                controller: controller.imageController,
                decoration: const InputDecoration(labelText: "Image URL"),
              ),

              const SizedBox(height: 24),

              Obx(() {
                return ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.createProduct,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("Save Product"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}