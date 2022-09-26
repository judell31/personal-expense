import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
