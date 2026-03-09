import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../features/Cart/data/datasources/cart_remote_data_source.dart';
import '../../features/Cart/data/repositories/cart_repository_impl.dart';
import '../../features/Cart/domain/repositories/cart_repository.dart';
import '../../features/Cart/presentation/controllers/cart_controller.dart';
import '../network/api_client.dart';
import '../network/dio_provider.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => DioProvider.createDio());
    Get.lazyPut<ApiClient>(() => ApiClient(Get.find<Dio>()));

    Get.lazyPut<CartRemoteDataSource>(
      () => CartRemoteDataSource(Get.find<ApiClient>()),
      fenix: true,
    );

    Get.lazyPut<CartRepository>(
      () => CartRepositoryImpl(Get.find<CartRemoteDataSource>()),
      fenix: true,
    );

    Get.put<CartController>(CartController(Get.find()), permanent: true);
  }
}