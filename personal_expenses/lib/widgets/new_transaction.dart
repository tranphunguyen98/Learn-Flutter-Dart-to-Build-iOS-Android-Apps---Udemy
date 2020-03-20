import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 8),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleControler,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountControler,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          FlatButton(
            child: Text(
              "Add transaction",
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: () {
              submitData();
            },
          )
        ]),
      ),
    );
  }

  void submitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransaction(enteredTitle, enteredAmount);
  }
}
