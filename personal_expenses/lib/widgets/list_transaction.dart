import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class ListTransaction extends StatelessWidget {
  final List<Transaction> _transactions;

  ListTransaction(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (buildContext, index) {
          return Card(
            child: Row(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: Colors.purple, width: 2)),
                padding: EdgeInsets.all(8),
                child: Text(
                  "\$${_transactions[index].amount.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  _transactions[index].title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMd().format(_transactions[index].date),
                  style: TextStyle(color: Colors.grey),
                )
              ]),
            ]),
          );
        },
        itemCount: _transactions.length,
      ),
    );
  }
}
