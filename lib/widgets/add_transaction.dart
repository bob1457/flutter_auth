import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  AddTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
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
              ),
              SizedBox(height: 7),
              TextButton(
                child: Text('Add Traansaction'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  primary: Colors.purple,
                  padding: EdgeInsets.all(10),
                  side: BorderSide(color: Colors.purpleAccent, width: 1),
                ),
                onPressed: () {
                  print(titleInputController.text);
                  addTransaction(
                    titleInputController.text,
                    double.parse(amountInputController.text),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
