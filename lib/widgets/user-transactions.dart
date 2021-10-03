import 'package:flutter/material.dart';
import 'package:flutter_auth/models/transaction.dart';
import 'package:flutter_auth/widgets/add_transaction.dart';
import 'package:flutter_auth/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({
    Key? key,
    required this.titleInputController,
    required this.amountInputController,
  }) : super(key: key);

  final TextEditingController titleInputController;
  final TextEditingController amountInputController;

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
    return Column(
      children: [
        AddTransaction(_addTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
