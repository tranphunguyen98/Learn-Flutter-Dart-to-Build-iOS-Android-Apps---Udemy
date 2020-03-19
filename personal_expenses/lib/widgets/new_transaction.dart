import 'package:flutter/material.dart';

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
            decoration: InputDecoration(labelText: "Amout"),
            controller: amountControler,
          ),
          FlatButton(
            child: Text(
              "Add transaction",
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: () {
              addTransaction(
                  titleControler.text, double.parse(amountControler.text));
            },
          )
        ]),
      ),
    );
  }
}
