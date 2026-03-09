import 'package:get/get.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_product_details_usecase.dart';

class ProductDetailsController extends GetxController {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsController(this.getProductDetailsUseCase);

  final product = Rxn<Product>();
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  late int productId;

  @override
  void onInit() {
    productId = Get.arguments;
    fetchProduct();
    super.onInit();
  }

  Future<void> fetchProduct() async {
    try {
      isLoading.value = true;

      final result = await getProductDetailsUseCase(productId);

      product.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}