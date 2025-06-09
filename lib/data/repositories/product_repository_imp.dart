import 'package:shopping_app_solid_architecture/data/datasources/product_api_service.dart';
import 'package:shopping_app_solid_architecture/data/datasources/product_local_db.dart';
import 'package:shopping_app_solid_architecture/domain/entities/product.dart';
import 'package:shopping_app_solid_architecture/domain/repositories/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductApiService apiService;
  final ProductLocalDb localDb;

  ProductRepositoryImp(this.apiService, this.localDb);

  @override
  Future<List<Product>> fetchProducts() async {
    final products = await apiService.fetchProducts();
    return products;
    // try {
    //   final products = await apiService.fetchProducts();
    //   await localDb.insertProducts(products);
    //   return products;
    // } catch (e) {
    //   return await localDb.getProducts();
    // }
  }
}
