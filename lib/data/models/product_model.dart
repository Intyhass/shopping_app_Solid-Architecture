import 'package:shopping_app_solid_architecture/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({required int id, required String title, required double price})
    : super(id: id, title: title, price: price);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'price': price};
  }
}
