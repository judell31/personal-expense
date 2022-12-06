import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  // TransactionList({Key? key}) : super(key: key);
  const TransactionList(this.transactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      // ListView.builder() optimize only load whats visible
      child: transactions.isEmpty ? Column(
        children: <Widget>[
          Text(
            "No Transactions added yet!",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: Image.asset(
              "assets/images/waiting.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) : ListView.builder(
      // child: ListView(
        // renders when elements are off screen
        // child: Column(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5
            ),
            child: ListTile(
              leading: Container(
              // leading: CircleAvatar(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle
                ),
                // radius: 30,
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text("\$${transactions[index].amount}"),
                    )
                ),
              ),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transactions[index].id),
              ),
            ),
          );
          // return Card(
          //   child: Row(
          //     children: <Widget>[
          //       Container(
          //         margin:
          //         const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Theme.of(context).primaryColorDark,
          //             width: 2,
          //           ),
          //         ),
          //         padding: const EdgeInsets.all(10),
          //         child: Text(
          //           "\$${transactions[index].amount.toStringAsFixed(2)}",
          //           //tx.amount.toString(),
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 20,
          //               color: Theme.of(context).primaryColorDark
          //           ),
          //         ),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           Text(
          //             transactions[index].title,
          //             style: Theme.of(context).textTheme.titleLarge,
          //           ),
          //           Text(
          //             DateFormat.yMMMd().format(transactions[index].date),
          //             // DateFormat("MM-dd-yyyy").format(tx.date),
          //             // tx.date.toString(),
          //             style: const TextStyle(color: Colors.grey),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
