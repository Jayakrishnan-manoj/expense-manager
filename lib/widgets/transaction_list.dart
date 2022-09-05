import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  //TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ?LayoutBuilder(builder: ((context, constraints) {
          return Column(
            children: [
              Text(
                'No transactions yet!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: constraints.maxHeight* 0.5,
                child: Image.asset(
                  'assets/image/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        })) 
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      )),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                    onPressed: () => deleteTx(transactions[index].id),
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
