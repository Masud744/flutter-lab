void main() {
  Map<String, dynamic> person = {
    'name': 'Shahriar Alom Masud',
    'address': 'Dhaka, Bangladesh',
    'age': 22,
    'country': 'Bangladesh',
  };

  print('Initial map:');
  person.forEach((key, value) {
    print('$key: $value');
  });

  // Updating country
  person['country'] = 'Germany';

  print('\nAfter updating country:');
  person.forEach((key, value) {
    print('$key: $value');
  });
}
