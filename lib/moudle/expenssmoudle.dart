import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatedate = DateFormat.yMd();

enum Category { food, travel, work, leisure }

final iconcategory = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.time_to_leave_sharp,
  Category.work: Icons.work_outlined,
  Category.leisure: Icons.movie_outlined,
};

class Expenssmoudle {
  Expenssmoudle({
    required this.tatile,
    required this.expenss,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String tatile;
  final double expenss;
  final DateTime date;
  final Category category;

  get formatdate {
    return formatedate.format(date);
  }
}

class Expensesbuket {
  Expensesbuket({required this.category, required this.expenses});

  Expensesbuket.forcategory(List<Expenssmoudle> allexpenses, this.category)
      : expenses =
            allexpenses.where((expens) => expens.category == category).toList();

  final List<Expenssmoudle> expenses;
  final Category category;

  double sum = 0;

  double get totalsum {
    for (final expense in expenses) {
      sum += expense.expenss;
    }
    return sum;
  }
}
