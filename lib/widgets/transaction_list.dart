import 'package:flutter/material.dart';
import 'package:flutter_auth/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(height: 25),
                Text(
                  'No trnasactions at this time',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Container(
                    height: 100,
                    child: Image.asset('asset/images/Flutter.png')),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return _buildTransactionContent(context, index);
              },
              itemCount: transactions.length,
            ),
    );
  }

  Widget _buildTransactionContent(BuildContext context, int index) {
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
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            padding: EdgeInsets.all(12),
            child: Text(
              // tx.amount.toString(),
              '\$${transactions[index].amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
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
                style: Theme.of(context).textTheme.headline1,
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
