import 'package:flutter/material.dart';
import 'package:project_march/expense_tracker/widgets/transaction_card.dart';
import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MaterialApp(home: Home(), theme: ThemeData.dark()));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> userTransaction = [];

  List<Transaction> get recentTransaction_dumb {
    return userTransaction.where((transaction_iterated_element) {
      return transaction_iterated_element.created
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addNewTransaction(
      String passedTitle, double passedAmount, DateTime chosenDate) {
    final newTransactionAdded = Transaction(
        id: DateTime.now().toString(),
        name: passedTitle,
        amount: passedAmount,
        created: chosenDate);

    setState(() {
      userTransaction.add(newTransactionAdded);
    });
  }

  void AddNewTransaction_BottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bcontext) => transactionCard(addNewTransaction));
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransaction
          .removeWhere((iterated_element) => iterated_element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Expense TrackerX"),
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Chart(recentTransaction_dumb),
          TransactionList_Widg(userTransaction, deleteTransaction)
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).highlightColor,
          onPressed: () {
            return AddNewTransaction_BottomSheet(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
