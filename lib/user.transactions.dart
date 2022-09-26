import 'package:flutter/cupertino.dart';
import 'package:personal_expense/transaction.list.dart';

import 'models/transaction.dart';
import 'new.transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList()
      ],
    );
  }
}
