import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/add_transaction.dart';
import 'package:flutter_auth/widgets/transaction_list.dart';

import 'models/transaction.dart';

class LandingPage extends StatefulWidget {
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

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // final titleInputController = TextEditingController();

  // final amountInputController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Mock data
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

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        id: DateTime.now().toString(),
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () => _addNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
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
            TransactionList(_userTransactions),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNewTransaction(context),
      ),
    );
  }

  void _addNewTransaction(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddTransaction(_addTransaction);
        },
      );
}
