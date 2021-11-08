import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import "./model/transaction.dart";

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [
    Transaction(
        id: "t1", title: "New shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Weekly groceries",
        amount: 16.53,
        date: DateTime.now())
  ];

  void _starNewTransaction(BuildContext ctxt) {
    showModalBottomSheet(context: ctxt, builder: (_) {
      return NewTransaction(_addNewTransaction);
    });
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTX = Transaction(amount: txAmount, title: txTitle, id: DateTime.now().toString(),
    date: DateTime.now());

    setState(() {
      _userTransactions.add(newTX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          actions: [
            IconButton(onPressed: () {
              _starNewTransaction(context);
            }, icon: Icon(Icons.add)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.blue,
                child: Container(
                    width: double.infinity, child: Text("Chart View")),
                elevation: 5,
              ),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: () {
          _starNewTransaction(context);
        },),
        );
  }
}
