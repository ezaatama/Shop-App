import 'package:flutter/material.dart';
import '/widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text("My Shop"),
        ),
        body: ProductGrid(),
      );
  }
}

