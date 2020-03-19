import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/list_transaction.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction.now(id: "1", title: "New Shoes", amount: 12.3),
    Transaction.now(id: "2", title: "New Clothes", amount: 22.1),
    Transaction.now(id: "3", title: "Bananas", amount: 13.9),
  ];

  void _addTransaction(String tsTitle, double tsAmount) {
    final newTs = Transaction.now(
        id: DateTime.now().toString(), title: tsTitle, amount: tsAmount);
    
    setState(() {
      _transactions.add(newTs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(_addTransaction), ListTransaction(this._transactions)],
    );
  }
}
