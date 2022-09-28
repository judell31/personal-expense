import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function addTx;

  TransactionForm(this.addTx, {super.key});
// NewTransaction({Key? key, required this.addTx}) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void addTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(labelText: "Title"),
            controller: titleController,
            onSubmitted: (_) => addTransaction(),
            // onChanged: (value) {
            //   titleInput = value;
            // },
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => addTransaction(), // (_) get an arg but i don't care about it or use it
            // onChanged: (value) => amountInput = value,
          ),
          TextButton(
            onPressed: addTransaction,
            style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
            child: const Text("Add Transaction"),
          ),
        ],
      ),
    ));
  }
}
