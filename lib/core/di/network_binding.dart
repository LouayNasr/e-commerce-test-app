import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../network/api_client.dart';
import '../network/dio_provider.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => DioProvider.createDio());
    Get.lazyPut<ApiClient>(() => ApiClient(Get.find<Dio>()));
  }
}