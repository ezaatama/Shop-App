import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects_udemy1/providers/orders.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);

  final ItemOrder order;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.order.amount}"),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            }, icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          if(_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.products.map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.title, style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    )),
                    Text("${e.quantity}x \$${e.price}", style: TextStyle(fontSize: 18, color: Colors.grey))
                  ],
                )).toList(),
              ),
            )
        ],
      ),
    );
  }
}