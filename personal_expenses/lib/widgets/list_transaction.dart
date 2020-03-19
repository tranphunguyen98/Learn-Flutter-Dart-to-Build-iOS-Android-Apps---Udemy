import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class ListTransaction extends StatelessWidget {
  final List<Transaction> _transactions;

  ListTransaction(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _transactions.map((trans) {
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
    }).toList());
  }
}
