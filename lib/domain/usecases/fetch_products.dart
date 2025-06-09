import 'package:shopping_app_solid_architecture/data/repositories/product_repository_imp.dart';
import 'package:shopping_app_solid_architecture/domain/entities/product.dart';
import 'package:shopping_app_solid_architecture/domain/repositories/product_repository.dart';

class FetchProducts {
  final ProductRepository repository;
  FetchProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.fetchProducts();
  }
}
