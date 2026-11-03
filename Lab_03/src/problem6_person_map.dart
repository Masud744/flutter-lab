// Lab 03 - Problem 6: Create a map with name, address, age, country keys and store values to it.
// Update country name to other country and print all keys and values.

void main() {
  print('========================================');
  print('   Problem 6: Person Map & Update Key   ');
  print('========================================');

  // Step 1: Create a map with name, address, age, country keys
  Map<String, dynamic> person = {
    'name': 'Shahriar Alom Masud',
    'address': 'Gazipur, Dhaka',
    'age': 22,
    'country': 'Bangladesh',
  };

  print('\n--- Initial Map Data ---');
  person.forEach((key, value) {
    print('$key : $value');
  });

  // Step 2: Update country name to other country
  print('\nUpdating country: "${person['country']}" -> "Japan"...');
  person['country'] = 'Japan';

  // Step 3: Print all keys and values
  print('\n--- Updated Map Data (All Keys and Values) ---');
  for (var entry in person.entries) {
    print('${entry.key.padRight(10)}: ${entry.value}');
  }
}

