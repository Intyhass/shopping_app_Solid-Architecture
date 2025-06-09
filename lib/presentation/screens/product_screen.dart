import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_solid_architecture/presentation/bloc/product_bloc.dart';
import 'package:shopping_app_solid_architecture/presentation/bloc/product_event.dart';
import 'package:shopping_app_solid_architecture/presentation/bloc/product_state.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          print('Bloc State: $state');
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error loading products'));
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                print('LoadProducts dispatched');
                context.read<ProductBloc>().add(LoadProducts());
              },
              child: Text('Load Products'),
            ),
          );
        },
      ),
    );
  }
}
