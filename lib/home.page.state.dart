import 'package:flutter/material.dart';
import 'package:personal_expense/transaction.dart';

import 'home.page.dart';

class HomePageState extends State<HomePage> {
  int _counter = 0;

  final List<Transaction> transactions = [
    Transaction(
        id: "t1",
        title: "New shoes",
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(
        id: "t2",
        title: "Games",
        amount: 69.99,
        date: DateTime.now()
    ),
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("Chart!"),
            ),
          ),
          Column(
            children: transactions.map(
                    (tx) {
                      return Card(
                        child: Text(tx.title),
                      );
                    }).toList(),
          )
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}