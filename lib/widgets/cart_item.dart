import 'package:flutter/material.dart';
import 'package:projects_udemy1/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItemW extends StatelessWidget {
  const CartItemW({Key? key, required this.id, required this.productId, required this.price, required this.quantity, required this.title}) : super(key: key);

  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        child: Icon(Icons.delete, color: Colors.white, size: 40),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,vertical: 4
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,vertical: 4
        ),
        child: Padding(padding: 
          const EdgeInsets.all(6),
          child: ListTile(
            title: Text(title),
            subtitle: Text("Total: \$${(price * quantity)}"),
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(child: Text("\$$price")),
              ),
            ),
            trailing: Text("$quantity x"),
          ),
        ),
      ),
    );
  }
}