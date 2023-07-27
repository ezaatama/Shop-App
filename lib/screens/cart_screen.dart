import 'package:flutter/material.dart';
import 'package:projects_udemy1/providers/cart.dart';
import 'package:projects_udemy1/providers/orders.dart';
import 'package:projects_udemy1/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("Your Cart"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontSize: 20)),
                  Spacer(),
                  Chip(
                    label: Text(
                      "\$${cart.totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleMedium!
                              .color),
                    ),
                    backgroundColor: Colors.deepPurple,
                  ),
                  TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                        cart.clear();
                      },
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(color: Colors.deepPurple),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, i) {
                    return CartItemW(
                      id: cart.items.values.toList()[i].id,
                      productId: cart.items.keys.toList()[i],
                      title: cart.items.values.toList()[i].title,
                      price: cart.items.values.toList()[i].price,
                      quantity: cart.items.values.toList()[i].quantity!,
                    );
                  }))
        ],
      )),
    );
  }
}
