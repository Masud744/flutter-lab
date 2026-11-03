import 'dart:io';

void main() {
  int sum = 0;
  int number;

  do {
    stdout.write('Enter a positive number: ');
    number = int.parse(stdin.readLineSync()!);

    if (number > 0) {
      sum += number;
    }
  } while (number >= 0);

  print('Final sum = $sum');
}
