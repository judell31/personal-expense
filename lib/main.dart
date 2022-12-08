import 'package:flutter/material.dart';
import 'package:personal_expense/widgets/chart.dart';
import 'package:personal_expense/widgets/transaction.list.dart';
import 'package:personal_expense/widgets/user.transactions.dart';

import 'models/transaction.dart';
import 'widgets/transaction.form.dart';

// void main() {
//   runApp(const PersonalExpense());
// }

void main() => runApp(const PersonalExpense());

class PersonalExpense extends StatelessWidget {
  const PersonalExpense({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
      textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
          labelSmall: const TextStyle(
            color: Colors.white,
          )
        ),
        appBarTheme: AppBarTheme(
            titleTextStyle: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ).headline6,
        ),
        fontFamily: 'Quicksand',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green
        )
            .copyWith(secondary: Colors.amber)
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "t1", title: "New shoes", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t2", title: "Games", amount: 69.99, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: TransactionForm(_addNewTransaction),
        );
      },
    );
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
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

    final appBar =  AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: const Text("Personal Expense"),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        )
      ],
    );

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.3,
              child: Chart(_recentTransactions),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
              child: TransactionList(_userTransactions, _deleteTransaction),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.,
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: const Icon(Icons.add),
        )
        // body: Column(
        //   // mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: const <Widget>[
        //     SizedBox(
        //       width: double.infinity,
        //       child: Card(
        //         color: Colors.blue,
        //         elevation: 5,
        //         child: Text("Chart!"),
        //       ),
        //     ),
        //     UserTransactions()
        //   ],
        // ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
