import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/widgets/list_transaction.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

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
    Transaction.now(id: "1", title: "New Shoes", amount: 12.3),
    Transaction.now(id: "2", title: "New Clothes", amount: 22.1),
    Transaction.now(id: "3", title: "Bananas", amount: 13.9),
    Transaction.now(id: "4", title: "Restaurant", amount: 8.9),
    Transaction.now(id: "5", title: "New Hats", amount: 77.9),
    Transaction.now(id: "6", title: "New Shorts", amount: 17.9),
    Transaction.now(id: "7", title: "New Cups", amount: 47.9),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date.isAfter(DateTime.now().subtract(Duration(
        days: 7,
      )));
    }).toList();
  }

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

  void _addTransaction(String tsTitle, double tsAmount, DateTime tsDate) {
    final newTs = Transaction(
        id: DateTime.now().toString(),
        title: tsTitle,
        amount: tsAmount,
        date: tsDate);

    setState(() {
      _transactions.add(newTs);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transaction) {
        return transaction.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text("Personal Expenses"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          },
        )
      ],
    );

    final mediaQuery = MediaQuery.of(context);

    final bodyHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Show Chart"),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (isLandscape)
              _showChart
                  ? Container(
                      height: bodyHeight * 0.7,
                      child: Chart(_recentTransactions),
                    )
                  : Container(
                      height: bodyHeight * 0.7,
                      child: ListTransaction(_transactions, _deleteTransaction),
                    ),
            if (!isLandscape)
              Container(
                height: bodyHeight * 0.3,
                child: Chart(_recentTransactions),
              ),
            if (!isLandscape)
              Container(
                height: bodyHeight * 0.7,
                child: ListTransaction(_transactions, _deleteTransaction),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _startAddNewTransaction(context);
              }),
    );
  }
}
