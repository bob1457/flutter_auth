import 'package:flutter/material.dart';
import 'package:flutter_auth/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key? key}) : super(key: key);

  // final List<Transaction> _userTransactions = [
  //   // Mock data
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

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _buildTransactionContent(index);
        },
        itemCount: transactions.length,
      ),
    );
  }

  Widget _buildTransactionContent(int index) {
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
              '\$${transactions[index].amount}',
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
                transactions[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                DateFormat.yMMMMd().format(transactions[index].date),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}