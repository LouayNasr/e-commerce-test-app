import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_remote_data_source.dart';

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