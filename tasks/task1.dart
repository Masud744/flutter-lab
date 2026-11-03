
import 'dart:io';

void main() {
  int sum = 0;
  int number = 0;

  stdout.write("Enter a positive number: ");
  number = int.parse(stdin.readLineSync()!);

  while (number >= 0) {
    if (number > 0) {
      sum += number;
    }

    stdout.write("Enter a positive number: ");
    number = int.parse(stdin.readLineSync()!);
  }

  print("Final sum = $sum");
}
