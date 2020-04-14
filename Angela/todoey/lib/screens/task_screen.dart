import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(primaryColor: Colors.lightBlueAccent),
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 24.0, bottom: 20),
              child: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'TODOEY',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 8.0),
              child: Text(
                '12 Task',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 20.0,
                ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Text('This is a task'),
                          trailing: Checkbox(
                            onChanged: (value) {},
                            value: false,
                          ),
                        ),
                        ListTile(
                          leading: Text('This is a task'),
                          trailing: Checkbox(
                            onChanged: (value) {},
                            value: false,
                          ),
                        ),
                        ListTile(
                          leading: Text('This is a task'),
                          trailing: Checkbox(
                            onChanged: (value) {},
                            value: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
