import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  String token;

  Orders(this.token);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url = "https://myshop-77c17.firebaseio.com/orders.json?auth=$token";

    try {
      final response = await http.get(url);

      final List<OrderItem> loadedOrders = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(response.body);

      if (extractedData == null) return;

      extractedData.forEach((orderId, orderdata) {
        loadedOrders.add(
          OrderItem(
            id: orderId,
            amount: orderdata['amount'],
            dateTime: DateTime.parse(orderdata['dateTime']),
            products: (orderdata['products'] as List<dynamic>).map((item) {
              return CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quanlity'],
                  title: item['title']);
            }).toList(),
          ),
        );
      });

      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = "https://myshop-77c17.firebaseio.com/orders.json?auth=$token";
    final timestamp = DateTime.now();

    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quanlity': cp.quantity,
                  'price': cp.price,
                })
            .toList()
      }),
    );

    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
