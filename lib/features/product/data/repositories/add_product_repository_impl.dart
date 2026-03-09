

import 'package:fsit_test/features/product/domain/entities/product.dart';

import '../../domain/repositories/add_product_repository.dart';
import '../datasources/add_product_remote_data_source.dart';
import '../models/product_model.dart';
import '../models/rating_model.dart';

class AddProductRepositoryImpl  implements AddProductRepository{
  final AddProductRemoteDataSource remoteDataSource;

  AddProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> addProduct(Product product) async {
    final model = ProductModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
      rating: RatingModel(
        rate: product.rating.rate,
        count: product.rating.count,
      ),
    );

    await remoteDataSource.addProduct(model);
  }
}