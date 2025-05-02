import 'package:flutter/material.dart';
import 'package:expenss_app/moudle/expenssmoudle.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.newexpenses});
  final void Function(Expenssmoudle newexpenses) newexpenses;

  @override
  State<NewExpenses> createState() {
    return _NewExpenses();
  }
}

class _NewExpenses extends State<NewExpenses> {
  final _initailtitle = TextEditingController();
  final _amount = TextEditingController();
  DateTime? pickeddate;
  Category _selectedcategory = Category.leisure;

  @override
  void dispose() {
    _initailtitle.dispose();
    _amount.dispose();
    super.dispose();
  }

  void _presentdatepicker() async {
    final DateTime firstDate = DateTime(1940, 1, 1);
    final DateTime lastDate = DateTime.now();
    final datePicked = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      pickeddate = datePicked;
    });
  }

  void _saveexpenses() {
    final enteredamount = double.tryParse(_amount.text);
    final amoumntisinvaild = enteredamount == null || enteredamount <= 0;
    if (_initailtitle.text.trim().isEmpty ||
        amoumntisinvaild ||
        pickeddate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'invalid input',
          ),
          content: const Text(
            'please sure the title or date ot amount is a vaild or non-empty',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text(
                'ok',
              ),
            )
          ],
        ),
      );
      return;
    }
    widget.newexpenses(
      Expenssmoudle(
        tatile: _initailtitle.text,
        expenss: enteredamount,
        date: pickeddate!,
        category: _selectedcategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardspace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 16, 10, keyboardspace + 16),
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text(
                                'title of expenses',
                              ),
                            ),
                            controller: _initailtitle,
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _amount,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixText: '\$',
                              label: Text(
                                'Amount',
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    TextField(
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text(
                          'title of expenses',
                        ),
                      ),
                      controller: _initailtitle,
                    ),
                  if (width >= 600)
                    Row(
                      children: [
                        DropdownButton(
                          value: _selectedcategory,
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category.name.toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (valeu) {
                            if (valeu == null) {
                              return;
                            }
                            setState(() {
                              _selectedcategory = valeu;
                            });
                          },
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                pickeddate == null
                                    ? 'No date selected'
                                    : formatedate.format(pickeddate!),
                              ),
                              IconButton(
                                onPressed: _presentdatepicker,
                                icon: const Icon(
                                  Icons.calendar_month,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _amount,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixText: '\$',
                              label: Text(
                                'Amount',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                pickeddate == null
                                    ? 'No date selected'
                                    : formatedate.format(pickeddate!),
                              ),
                              IconButton(
                                onPressed: _presentdatepicker,
                                icon: const Icon(
                                  Icons.calendar_month,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 18,
                  ),
                  if (width >= 600)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _saveexpenses,
                          child: const Text(
                            'save expense',
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        DropdownButton(
                          value: _selectedcategory,
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category.name.toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (valeu) {
                            if (valeu == null) {
                              return;
                            }
                            setState(() {
                              _selectedcategory = valeu;
                            });
                          },
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _saveexpenses,
                          child: const Text(
                            'save expense',
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
