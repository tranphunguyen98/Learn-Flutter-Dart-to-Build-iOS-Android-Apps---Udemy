import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/list_transaction.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: "RobotoMono"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction.now(id: "1", title: "New Shoes", amount: 12.3),
    // Transaction.now(id: "2", title: "New Clothes", amount: 22.1),
    // Transaction.now(id: "3", title: "Bananas", amount: 13.9),
  ];

  void _startAddNewTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(_addTransaction));
        });
  }

  void _addTransaction(String tsTitle, double tsAmount) {
    final newTs = Transaction.now(
        id: DateTime.now().toString(), title: tsTitle, amount: tsAmount);

    setState(() {
      _transactions.add(newTs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startAddNewTransaction(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            ListTransaction(_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          }),
    );
  }
}
