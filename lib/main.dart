import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "1",
      title: "New Expense",
      amount: 100.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "New Expense -2 ",
      amount: 101.0,
      date: DateTime.now(),
    )
  ];
  String expenseTitleInput;
  String expenseAmountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Container(
                child: Text("Chart"),
                width: double.infinity,
              ),
            ),
            Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        decoration:
                            InputDecoration(labelText: "Expense Title."),
                        onChanged: (value) {
                          expenseTitleInput = value;
                        },
                      ),
                      TextField(
                        decoration:
                            InputDecoration(labelText: "Expense Ammount."),
                        onChanged: (value) {
                          expenseAmountInput = value;
                        },
                      ),
                      FlatButton(
                        child: Text("Add Transaction"),
                        textColor: Colors.blue,
                        onPressed: () {
                          print(expenseTitleInput + " : " + expenseAmountInput);
                        },
                      ),
                    ],
                  ),
                )),
            Column(
                children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '\$ ${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          // DateFormat('yyyy-MM-dd').format(tx.date),
                          DateFormat.yMd().format(tx.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList())
          ],
        ));
  }
}
