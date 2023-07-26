import 'package:flutter/material.dart';
import 'package:projects_udemy1/providers/cart.dart';
import '/providers/product.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(
    this.id,
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.pink,
            leading: Consumer<Product>(
              builder: (context, product, _) {
                return IconButton(
                  onPressed: () {
                    product.toggleFavoriteStatus();
                  },
                  icon: Icon(product.isFavorite? Icons.favorite : Icons.favorite_border),
                  color: Colors.white,
                );
              }
            ),
            title: Text(
              product.title,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.white,
            ),
          )),
    );
  }
}
