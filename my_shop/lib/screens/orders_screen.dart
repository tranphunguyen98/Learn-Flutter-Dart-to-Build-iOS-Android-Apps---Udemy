import 'package:flutter/material.dart';
import 'package:my_shop/providers/orders.dart';
import 'package:my_shop/widgets/app_drawer.dart';
import 'package:my_shop/widgets/order_item.dart' as OrdItem;
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Order"),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
            future:
                Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.error != null) {
                  return Center(child: Text("Something wrong!"));
                } else {
                  return Consumer<Orders>(
                    builder:
                        (BuildContext context, Orders orders, Widget child) =>
                            ListView.builder(
                      itemCount: orders.orders.length,
                      itemBuilder: (ctx, index) {
                        return OrdItem.OrderItem(orders.orders[index]);
                      },
                    ),
                  );
                }
              }
            }));
  }
}
