import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  // TransactionList({Key? key}) : super(key: key);
  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
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
        ),
      ),
    );
  }
}
