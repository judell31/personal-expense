import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx, {super.key});
  // NewTransaction({Key? key, required this.addTx}) : super(key: key);

  void addTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(enteredTitle, enteredAmount);
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
