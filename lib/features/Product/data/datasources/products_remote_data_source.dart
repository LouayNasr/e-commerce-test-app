import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';
import '../models/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();

  Future<ProductModel> getProductDetails(int id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiClient apiService;

  ProductsRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await apiService.get(ApiConstants.products);

    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<ProductModel> getProductDetails(int id) async {
    final response = await apiService.get(
      '/products/$id',
    ); // fixme to be replaced with the correct endpoint

    return ProductModel.fromJson(response.data);
  }
}
