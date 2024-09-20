import 'package:dio/dio.dart';

import '../../../../core/response_validator.dart';
import '../model/ProductEntity.dart';

abstract class IProductDataSource {
  Future<List<Product>> getAll();
}

class ProductRemoteDataSource with HttpResponseValidator implements IProductDataSource {
  final Dio httpClient;

  ProductRemoteDataSource(this.httpClient);

  @override
  Future<List<Product>> getAll() async {
    final response = await httpClient.get('home/items');
    validateResponse(response);
    final products = <Product>[];
    (response.data as List).forEach((element) {
      products.add(Product.fromJson(element));
    });
    return products;
  }
}