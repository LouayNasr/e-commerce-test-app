import 'package:get/get.dart';

import '../../data/datasources/add_product_remote_data_source.dart';
import '../../data/repositories/add_product_repository_impl.dart';
import '../../domain/repositories/add_product_repository.dart';
import '../../domain/usecases/add_product_usecase.dart';
import '../controllers/add_product_controller.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<AddProductRemoteDataSource>(
          () => AddProductRemoteDataSourceImpl(Get.find()),
    );

    Get.lazyPut<AddProductRepository>(
          () => AddProductRepositoryImpl(Get.find()),
    );

    Get.lazyPut<AddProductUseCase>(
          () => AddProductUseCase(
        Get.find<AddProductRepository>(),
      ),
    );

    Get.lazyPut<AddProductController>(
          () => AddProductController(
        Get.find<AddProductUseCase>(),
      ),
    );
  }
}