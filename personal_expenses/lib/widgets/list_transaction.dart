import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class ListTransaction extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  ListTransaction(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: _transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transaction added yet!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/sleep.png",
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (buildContext, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text("\$${_transactions[index].amount}")),
                      ),
                      radius: 30,
                    ),
                    title: Text(_transactions[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(
                        DateFormat.yMMMd().format(_transactions[index].date)),
                    trailing: IconButton(
                        onPressed: () {
                          _deleteTransaction(_transactions[index].id);
                        },
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor),
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
