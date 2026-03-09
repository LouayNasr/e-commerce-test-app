import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/di/initial_binding.dart';
import 'core/routes/app_pages.dart';

void main() {
  InitialBinding().dependencies();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/products",
      getPages: AppPages.routes,
    );
  }
}