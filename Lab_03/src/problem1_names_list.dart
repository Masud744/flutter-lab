// Lab 03 - Problem 1: Create a list of names and print all names using list.

void main() {
  // Creating a list of string names
  List<String> names = ['Shahriar', 'Masud', 'Rafiqul', 'Tanvir', 'Sakib'];

  print('========================================');
  print('        Problem 1: List of Names        ');
  print('========================================');

  // Printing all names directly using list
  print('\nPrinting entire list directly:');
  print(names);

  // Printing names by iterating through the list
  print('\nPrinting names individually using loop:');
  for (int i = 0; i < names.length; i++) {
    print('${i + 1}. ${names[i]}');
  }
}

