import 'package:flutter/material.dart';
import '/providers/products.dart';
import 'package:provider/provider.dart';
import '/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;

  ProductGrid({required this.showFavs});

  @override
  Widget build(BuildContext context) {
  final productsData = Provider.of<Products>(context);
  final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // create: (c) => products[i],
        value: products[i],
        child: ProductItem(
            products[i].id,
            products[i].title, 
            products[i].imageUrl
          )
      ),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
