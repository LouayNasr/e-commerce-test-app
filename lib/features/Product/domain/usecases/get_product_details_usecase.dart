import '../entities/product.dart';
import '../repositories/products_repository.dart';

class GetProductDetailsUseCase {
  final ProductsRepository repository;

  GetProductDetailsUseCase(this.repository);

  Future<Product> call(int id) {
    return repository.getProductDetails(id);
  }
}