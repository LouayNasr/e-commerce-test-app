import 'package:fsit_test/features/Product/presentation/pages/products_page.dart';
import 'package:get/get.dart';

import '../../features/Product/presentation/bindings/products_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.products,
      page: () => const ProductsPage(),
      binding: ProductsBinding(),
    ),
  ];
}
