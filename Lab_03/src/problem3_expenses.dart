// Lab 03 - Problem 3: Create a program that reads list of expenses amount using user input and print total.

import 'dart:io';

void main() {
  List<double> expenses = [];

  print('========================================');
  print('     Problem 3: Expenses Calculator     ');
  print('========================================');

  stdout.write('Enter the number of expenses you want to input: ');
  String? countInput = stdin.readLineSync();
  int count = int.tryParse(countInput ?? '') ?? 0;

  if (count <= 0) {
    print('No expenses entered or invalid count.');
    return;
  }

  for (int i = 1; i <= count; i++) {
    stdout.write('Enter expense #$i amount: ');
    String? amountInput = stdin.readLineSync();
    double amount = double.tryParse(amountInput ?? '') ?? 0.0;
    expenses.add(amount);
  }

  // Calculating total expense using fold / reduce
  double totalExpense = expenses.fold(0.0, (previousValue, element) => previousValue + element);

  print('\n---------------- SUMMARY ----------------');
  print('List of entered expenses: $expenses');
  print('Total number of items: ${expenses.length}');
  print('Total Expenses: \$${totalExpense.toStringAsFixed(2)}');
  print('-----------------------------------------');
}

