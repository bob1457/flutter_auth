import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/add_transaction.dart';
import 'package:flutter_auth/widgets/chart.dart';
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
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 59.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Book',
    //   amount: 19.99,
    //   date: DateTime.now(),
    // ),
  ];

  void _addTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: DateTime.now().toString(),
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
    // return _userTransactions;
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Expense Tracker'),
      backgroundColor: Theme.of(context).primaryColor,
      actions: [
        IconButton(
          onPressed: () => _addNewTransaction(context),
          icon: Icon(Icons.add),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.25,
                child: Chart(_recentTransactions)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height) *
                    0.7,
                child: TransactionList(_userTransactions, _deleteTransaction)),
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
