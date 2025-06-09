import 'package:shopping_app_solid_architecture/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
}
