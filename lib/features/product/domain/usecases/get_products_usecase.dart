import '../entities/product.dart';
import '../repositories/products_repository.dart';

class GetProductsUseCase {
  final ProductsRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}