import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';
import '../../domain/entities/cart_item.dart';

class CartRemoteDataSource {
  final ApiClient apiClient;

  CartRemoteDataSource(this.apiClient);

  Future<void> checkout(List<CartItem> items) async {
    final products = items.map((e) => e.toJson()).toList();

    final body = {
      "id": 0,
      "userId": 0,
      "products": products,
    };

    await apiClient.post(ApiConstants.addCart, body);
  }
}