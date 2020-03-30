import 'package:flutter/material.dart';
import 'package:my_shop/providers/orders.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      body: ListView.builder(itemCount: orders.orders.length,
      itemBuilder: (ctx, index) {
        return 
      },),
    );
  }
}