

import '../entities/product.dart';

abstract class AddProductRepository {
  Future<void> addProduct(Product product);
}