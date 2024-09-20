import 'package:dio/dio.dart';

import '../../../../core/response_validator.dart';
import '../model/ProductEntity.dart';

abstract class IProductDataSource {
  Future<List<Product>> getAll();

  Future<List<Product>> search(String searchTerm);
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

  @override
  Future<List<Product>> search(String searchTerm) async {
    final response = await httpClient.get('product/search?q=$searchTerm');
    validateResponse(response);
    final products = <Product>[];
    (response.data as List).forEach((element) {
      products.add(Product.fromJson(element));
    });
    return products;
  }
}
