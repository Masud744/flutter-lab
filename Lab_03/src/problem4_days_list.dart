// Lab 03 - Problem 4: Create an empty list of type string called days.
// Use the add method to add names of 7 days and print all days.

void main() {
  print('========================================');
  print('    Problem 4: Days of the Week List    ');
  print('========================================');

  // Step 1: Create an empty list of type String called days
  List<String> days = [];
  print('Initial list: $days (Length: ${days.length})');

  // Step 2: Use the add method to add names of 7 days
  days.add('Monday');
  days.add('Tuesday');
  days.add('Wednesday');
  days.add('Thursday');
  days.add('Friday');
  days.add('Saturday');
  days.add('Sunday');

  // Step 3: Print all days
  print('\nPrinting all days after using add() method:');
  for (int i = 0; i < days.length; i++) {
    print('Day ${i + 1}: ${days[i]}');
  }

  print('\nComplete list representation: $days');
}

