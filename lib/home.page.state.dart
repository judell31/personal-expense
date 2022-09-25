import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/transaction.dart';

import 'home.page.dart';

class HomePageState extends State<HomePage> {
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

  // late String titleInput;
  // late String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
        // mainAxisAlignment: MainAxisAlignment.start,
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
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Title"
                    ),
                    controller: titleController,
                    // onChanged: (value) {
                    //   titleInput = value;
                    // },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: "Amount"
                    ),
                    controller: amountController,
                    // onChanged: (value) => amountInput = value,
                  ),
                  TextButton(
                    onPressed: () {
                      // print(titleInput);
                      // print(amountInput);
                      print(titleController.text);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blueAccent
                    ),
                    child: const Text("Add Transaction"),
                  ),
                ],
              ),
            )
          ),
          Column(
            children: transactions.map(
                    (tx) {
                      return Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 50
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "\$${tx.amount}",
                                //tx.amount.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  tx.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(tx.date),
                                  // DateFormat("MM-dd-yyyy").format(tx.date),
                                  // tx.date.toString(),
                                  style: const TextStyle(
                                    color: Colors.grey
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }).toList(),
          )
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}