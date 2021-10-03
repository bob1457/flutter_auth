import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/user-transactions.dart'
    show UserTransactions;

class LandingPage extends StatelessWidget {
  // const LandingPage({Key? key}) : super(key: key);

  // final List<Transaction> transactions = [
  //   // mock data
  //   Transaction(
  //     id: 't1',
  //     title: 'New Shoes',
  //     amount: 59.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'Book',
  //     amount: 19.99,
  //     date: DateTime.now(),
  //   ),
  // ];

  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Expense chart'),
                elevation: 5,
              ),
            ),
            UserTransactions(
                titleInputController: titleInputController,
                amountInputController: amountInputController),
            // TransactionList(),
          ],
        ),
      ),
    );
  }
}
