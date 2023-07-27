import 'package:flutter/material.dart';
import 'package:projects_udemy1/providers/orders.dart';
import 'package:projects_udemy1/widgets/app_drawer.dart';
import 'package:projects_udemy1/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: SafeArea(child: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) {
        return OrderItem(order: orderData.orders[index]);
      })),
    );
  }
}