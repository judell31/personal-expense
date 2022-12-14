import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/widgets/adaptive.button.dart';

class TransactionForm extends StatefulWidget {
  final Function addTx;

  TransactionForm(this.addTx, {super.key});
// NewTransaction({Key? key, required this.addTx}) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _addTransaction() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
        enteredTitle,
        enteredAmount,
        _selectedDate
    );

    Navigator.of(context).pop();
  }

  void _addDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now()
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // CupertinoTextField(
                //
                // ),
                TextField(
                  decoration: const InputDecoration(labelText: "Title"),
                  controller: _titleController,
                  onSubmitted: (_) => _addTransaction(),
                  // onChanged: (value) {
                  //   titleInput = value;
                  // },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: "Amount"),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _addTransaction(), // (_) get an arg but i don't care about it or use it
                  // onChanged: (value) => amountInput = value,
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _selectedDate == null ?
                          "No Date Chosen!" :
                          'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}', // TODO: ?
                        ),
                      ),
                      AdaptiveFlatButton(
                          "Chose Date",
                          _addDate
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _addTransaction,
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  // TODO: look at this
                  // style: TextButton.styleFrom(foregroundColor: Theme.of(context).textTheme.),
                  child: const Text("Add Transaction"),
                ),
              ],
            ),
          )),
    );
  }
}
