import 'package:fsit_test/features/Product/presentation/pages/products_page.dart';
import 'package:fsit_test/features/product/presentation/bindings/add_product_binding.dart';
import 'package:get/get.dart';

import '../../features/Cart/presentation/pages/cart_page.dart';
import '../../features/Product/presentation/bindings/product_details_binding.dart';
import '../../features/Product/presentation/bindings/products_binding.dart';
import '../../features/Product/presentation/pages/product_details_page.dart';
import '../../features/product/presentation/pages/add_product_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.products,
      page: () => const ProductsPage(),
      binding: ProductsBinding(),
    ),

    GetPage(
      name: AppRoutes.productDetails,
      page: () => const ProductDetailsPage(),
      binding: ProductDetailsBinding(),
    ),

    GetPage(
      name: AppRoutes.cart,
      page: () => const CartPage(),
    ),

    GetPage(
      name: AppRoutes.addProduct,
      page: () => const AddProductPage(),
      binding: AddProductBinding(),
    ),
  ];
}
