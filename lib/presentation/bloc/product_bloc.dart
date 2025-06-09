import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_solid_architecture/domain/usecases/fetch_products.dart';
import 'package:shopping_app_solid_architecture/presentation/bloc/product_event.dart';
import 'package:shopping_app_solid_architecture/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProducts fetchProducts;

  ProductBloc(this.fetchProducts) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        print('x Error in Bloc: $e');
        emit(ProductError('Failed to fetch products'));
      }
    });
  }
}
