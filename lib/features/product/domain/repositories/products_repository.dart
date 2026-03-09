import '../../data/datasources/products_remote_data_source.dart';
import '../entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductDetails(int id);
}

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() {
    return remoteDataSource.getProducts();
  }

  @override
  Future<Product> getProductDetails(int id) {
    return remoteDataSource.getProductDetails(id);
  }
}