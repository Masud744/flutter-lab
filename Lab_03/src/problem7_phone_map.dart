// Lab 03 - Problem 7: Create a map with name, phone keys and store some values to it.
// Use where to find all keys that have length 4.

void main() {
  print('========================================');
  print('   Problem 7: Map Filtering with where  ');
  print('========================================');

  // Creating a Map where keys represent contact names and values represent phone numbers
  Map<String, String> contacts = {
    'John': '01711001122',
    'Alex': '01822334455',
    'Masud': '01933445566',
    'Sara': '01544556677',
    'Rifat': '01655667788',
    'Liam': '01366778899',
    'Tanvir': '01777889900',
  };

  print('\n--- All Contacts in Map ---');
  contacts.forEach((name, phone) {
    print('${name.padRight(8)} (length: ${name.length}) -> $phone');
  });

  // Using .where() on keys to find all keys with length 4
  Iterable<String> length4Keys = contacts.keys.where((key) => key.length == 4);

  print('\n--- Keys Having Length 4 (Filtered via .where()) ---');
  for (String key in length4Keys) {
    print('Key: "$key" | Phone: ${contacts[key]}');
  }

  print('\nFiltered Keys List: ${length4Keys.toList()}');
}

