import 'package:flutter/cupertino.dart';
import 'package:personal_expense/widgets/transaction.list.dart';

import '../models/transaction.dart';
import 'transaction.form.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "t1", title: "New shoes", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t2", title: "Games", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t3", title: "Games", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t4", title: "Games", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t5", title: "Games", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t6", title: "Games", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t7", title: "Games", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t8", title: "Games", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t9", title: "Games", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t10", title: "Games", amount: 69.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //With () it executes without it passes the function
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
