import '../../../../core/http_client.dart';
import '../model/ProductEntity.dart';
import '../source/product_data_source.dart';

final productRepository = ProductRepository(ProductRemoteDataSource(httpClient));

abstract class IProductRepository {
  Future<List<Product>> getAll();


}

class ProductRepository implements IProductRepository {
  final IProductDataSource dataSource;

  ProductRepository(this.dataSource);

  @override
  Future<List<Product>> getAll() => dataSource.getAll();


}
