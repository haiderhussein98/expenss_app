import 'package:expenss_app/widget/expenses_list/expense_list.dart';
import 'package:flutter/material.dart';
import '../moudle/expenssmoudle.dart';
import 'new_expenses.dart';
import 'chart/chart.dart';

class Expenss extends StatefulWidget {
  const Expenss({super.key});

  @override
  State<Expenss> createState() {
    return _Expenss();
  }
}

class _Expenss extends State<Expenss> {
  void _addnewexpenses() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpenses(newexpenses: addanddisplaynewexpense),
    );
  }

  final List<Expenssmoudle> _myexpensess = [
    Expenssmoudle(
      tatile: 'flutter course',
      expenss: 15.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expenssmoudle(
      tatile: 'cinema',
      expenss: 20.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void addanddisplaynewexpense(Expenssmoudle newexpenses) {
    setState(() {
      _myexpensess.add(newexpenses);
    });
  }

  void _deleteexpenses(Expenssmoudle expensesdeleted) {
    final indexofexpenses = _myexpensess.indexOf(expensesdeleted);
    setState(() {
      _myexpensess.remove(expensesdeleted);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'expenses delete',
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                _myexpensess.insert(indexofexpenses, expensesdeleted);
              });
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    Widget maincontent =
        const Center(child: Text('list of expenses empty , add one! '));
    if (_myexpensess.isNotEmpty) {
      maincontent = Myexpenseelist(
        myexpensesslist: _myexpensess,
        deleteexpenses: _deleteexpenses,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'flutter expenseTracker',
          style: TextStyle(),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: _addnewexpenses,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
          child: width < 600
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chart(
                      expenses: _myexpensess,
                    ),
                    Expanded(
                      child: maincontent,
                    )
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Chart(
                        expenses: _myexpensess,
                      ),
                    ),
                    Expanded(
                      child: maincontent,
                    )
                  ],
                )),
    );
  }
}
