import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_solid_architecture/data/datasources/product_api_service.dart';
import 'package:shopping_app_solid_architecture/data/datasources/product_local_db.dart';
import 'package:shopping_app_solid_architecture/data/repositories/product_repository_imp.dart';
import 'package:shopping_app_solid_architecture/domain/usecases/fetch_products.dart';
import 'package:shopping_app_solid_architecture/presentation/bloc/product_bloc.dart';
import 'package:shopping_app_solid_architecture/presentation/screens/product_screen.dart';

void main() {
  final apiService = ProductApiService();
  final localDb = ProductLocalDb();
  final repository = ProductRepositoryImp(apiService, localDb);
  final fetchProducts = FetchProducts(repository);

  runApp(myApp(fetchProducts));
}

class myApp extends StatelessWidget {
  final FetchProducts fetchProducts;
  const myApp(this.fetchProducts);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ProductBloc(fetchProducts),
        child: ProductScreen(),
      ),
    );
  }
}
