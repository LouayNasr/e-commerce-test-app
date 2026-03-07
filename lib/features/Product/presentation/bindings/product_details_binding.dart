import 'package:get/get.dart';
import '../../domain/usecases/get_product_details_usecase.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<GetProductDetailsUseCase>(
          () => GetProductDetailsUseCase(Get.find()),
    );

    Get.lazyPut<ProductDetailsController>(
          () => ProductDetailsController(Get.find()),
    );
  }
}