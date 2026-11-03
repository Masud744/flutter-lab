// Lab 03 - Problem 2: Create a set of fruits and print all fruits using loop.

void main() {
  // Creating a Set of unique fruits
  Set<String> fruits = {'Apple', 'Banana', 'Mango', 'Orange', 'Strawberry', 'Pineapple'};

  print('========================================');
  print('        Problem 2: Set of Fruits        ');
  print('========================================');

  print('\nPrinting all fruits using for-in loop:');
  int index = 1;
  for (String fruit in fruits) {
    print('$index. $fruit');
    index++;
  }

  print('\nTotal unique fruits count: ${fruits.length}');
}

