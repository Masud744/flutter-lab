void main() {
  Map<String, String> contacts = {
    'John': '01711223344',
    'Alex': '01822334455',
    'Masud': '01933445566',
    'Sara': '01544556677',
    'Rifat': '01655667788',
    'Liam': '01366778899',
  };

  print('All contacts:');
  contacts.forEach((name, phone) {
    print('$name: $phone');
  });

  // Find all keys with length 4
  var keysLength4 = contacts.keys.where((key) => key.length == 4);

  print('\nKeys with length 4:');
  for (var key in keysLength4) {
    print('$key: ${contacts[key]}');
  }
}
