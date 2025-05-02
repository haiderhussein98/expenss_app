import 'package:flutter/material.dart';
import 'package:expenss_app/moudle/expenssmoudle.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenses});

  final Expenssmoudle expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenses.tatile,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(('\$${expenses.expenss.toStringAsFixed(2)}')),
                const Spacer(),
                Row(
                  children: [
                    Icon(iconcategory[expenses.category]),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(expenses.formatdate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
