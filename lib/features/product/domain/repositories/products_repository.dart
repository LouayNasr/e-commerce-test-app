import '../entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductDetails(int id);
}