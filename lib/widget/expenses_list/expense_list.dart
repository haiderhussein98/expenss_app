import 'package:expenss_app/main.dart';
import 'package:flutter/material.dart';
import '../../moudle/expenssmoudle.dart';
import 'expense_item.dart';

class Myexpenseelist extends StatelessWidget {
  const Myexpenseelist(
      {super.key, required this.myexpensesslist, required this.deleteexpenses});
  final List<Expenssmoudle> myexpensesslist;
  final void Function(Expenssmoudle expenses) deleteexpenses;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: myexpensesslist.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          decoration: BoxDecoration(
            color: kColorSchema.error.withAlpha(180),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            vertical: Theme.of(context).cardTheme.margin!.vertical,
          ),
        ),
        key: ValueKey(myexpensesslist[index]),
        onDismissed: (diraction) {
          deleteexpenses(
            myexpensesslist[index],
          );
        },
        child: ExpenseItem(
          expenses: myexpensesslist[index],
        ),
      ),
    );
  }
}
