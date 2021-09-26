import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/transaction.dart';

class LandingPage extends StatelessWidget {
  // const LandingPage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 59.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Book',
      amount: 19.99,
      date: DateTime.now(),
    ),
  ];

  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Expense chart'),
              elevation: 5,
            ),
          ),
          Container(
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
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black87,
                        ),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Text(
                        // tx.amount.toString(),
                        '\$${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          DateFormat.yMMMMd().format(tx.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
