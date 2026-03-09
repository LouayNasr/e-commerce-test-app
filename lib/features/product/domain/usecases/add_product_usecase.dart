import 'package:fsit_test/features/product/domain/repositories/add_product_repository.dart';

import '../entities/product.dart';

class AddProductUseCase {
  final AddProductRepository repository;

  AddProductUseCase(this.repository);

  Future<void> call(Product product) {
    return repository.addProduct(product);
  }
}