import 'dart:io';

void main() {
  List<double> expenses = [];

  stdout.write('How many expenses do you want to enter? ');
  int count = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < count; i++) {
    stdout.write('Enter expense ${i + 1}: ');
    double amount = double.parse(stdin.readLineSync()!);
    expenses.add(amount);
  }

  double total = 0;
  for (var e in expenses) {
    total += e;
  }

  print('\nAll expenses: $expenses');
  print('Total expense: \$${total.toStringAsFixed(2)}');
}
