import 'package:get/get.dart';

import '../../data/datasources/products_remote_data_source.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsRemoteDataSource>(
          () => ProductsRemoteDataSourceImpl(Get.find()),
    );

    Get.lazyPut<ProductsRepository>(
          () => ProductsRepositoryImpl(Get.find()),
    );

    Get.lazyPut(
          () => GetProductsUseCase(Get.find()),
    );

    Get.lazyPut(
          () => ProductsController(Get.find()),
    );
  }
}