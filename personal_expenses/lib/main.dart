import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';

import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction.now(id: "1", title: "New Shoes", amount: 12.3),
    Transaction.now(id: "2", title: "New Clothes", amount: 22.1),
    Transaction.now(id: "3", title: "Bananas", amount: 13.9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 100,
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Chart"),
            ),
          ),
          Column(
              children: transactions.map((trans) {
            return Card(
              child: Row(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: Colors.purple, width: 2)),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "\$${trans.amount}",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    trans.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(trans.date),
                    style: TextStyle(color: Colors.grey),
                  )
                ]),
              ]),
            );
          }).toList()),
        ],
      ),
    );
  }
}
