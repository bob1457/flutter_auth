import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;

  AddTransaction(this.addTransaction);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  DateTime? selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: titleInputController,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                  controller: amountInputController,
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedDate == null
                            ? 'No date selected'
                            : 'Picked date: ${DateFormat.yMd().format(selectedDate ?? DateTime.now())}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: _presentDatePicker,
                      style: OutlinedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      child: Text(
                        'Select Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                ElevatedButton(
                  child: Text('Add Traansaction'),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.white,
                    padding: EdgeInsets.all(10),
                    side: BorderSide(color: Colors.purpleAccent, width: 1),
                  ),
                  onPressed: _submitData,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submitData() {
    if (amountInputController.text.isEmpty) {
      return;
    }

    final title = titleInputController.text;
    final amount = double.parse(amountInputController.text);

    if (title.isEmpty || amount <= 0 || selectedDate == null) {
      return;
    }

    widget.addTransaction(
      title,
      amount,
      selectedDate,
    );

    Navigator.of(context).pop();
  }
}
