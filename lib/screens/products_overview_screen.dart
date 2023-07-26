import 'package:flutter/material.dart';
import 'package:projects_udemy1/providers/cart.dart';
import 'package:projects_udemy1/providers/products.dart';
import 'package:projects_udemy1/widgets/badge.dart';
import 'package:provider/provider.dart';
import '/widgets/product_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("My Shop"),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions val) {
                setState(() {
                  if (val == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text("Only Favorites"),
                        value: FilterOptions.Favorites),
                    PopupMenuItem(
                        child: Text("Show All"), value: FilterOptions.All)
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) =>
                Badges(child: ch!, value: cart.itemCount.toString()),
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          )
        ],
      ),
      body: ProductGrid(showFavs: _showOnlyFavorites),
    );
  }
}
