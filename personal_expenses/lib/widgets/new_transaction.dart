import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

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
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Text('No Date Chosen!'),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold),),
                  onPressed: () {},
                )
              ],
            ),
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Add transaction",
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

    widget.addTransaction(enteredTitle, enteredAmount);

    Navigator.pop(context);
  }
}
