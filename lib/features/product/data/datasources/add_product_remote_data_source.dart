
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';
import '../models/product_model.dart';

abstract class AddProductRemoteDataSource {
  Future<void> addProduct(ProductModel product);
}

class AddProductRemoteDataSourceImpl implements AddProductRemoteDataSource {
  final ApiClient apiService;

  AddProductRemoteDataSourceImpl(this.apiService);

  @override
  Future<void> addProduct(ProductModel product) async {
    await apiService.post(
      ApiConstants.products,
      product.toJson(),
    );
  }
}