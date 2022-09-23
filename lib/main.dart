import 'package:flutter/material.dart';
import 'package:personal_expense/transaction.dart';

import 'home.page.dart';

void main() {
  runApp(PersonalExpense());
}

class PersonalExpense extends StatelessWidget {
  PersonalExpense({super.key});

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
