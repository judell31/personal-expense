import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx, {super.key});
  // NewTransaction({Key? key, required this.addTx}) : super(key: key);

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
            // onChanged: (value) {
            //   titleInput = value;
            // },
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Amount"),
            controller: amountController,
            // onChanged: (value) => amountInput = value,
          ),
          TextButton(
            onPressed: () {
              // print(titleInput);
              // print(amountInput);
              addTx(titleController.text, double.parse(amountController.text));
            },
            style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
            child: const Text("Add Transaction"),
          ),
        ],
      ),
    ));
  }
}
