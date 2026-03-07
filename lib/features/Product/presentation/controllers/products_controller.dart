import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';

class ProductsController extends GetxController {
  final GetProductsUseCase getProductsUseCase;

  ProductsController(this.getProductsUseCase);

  final products = <Product>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final result = await getProductsUseCase();

      products.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}