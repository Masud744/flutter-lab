import 'dart:io';

String capitalizeWords(String text) {
  var words = text.split(' ');
  for (int i = 0; i < words.length; i++) {
    if (words[i].isNotEmpty) {
      words[i] = words[i][0].toUpperCase() + words[i].substring(1);
    }
  }
  return words.join(' ');
}

void main() {
  var dir = File(Platform.script.toFilePath()).parent.path;
  var inputFile = File('$dir/input.txt');
  var outputFile = File('$dir/output.txt');

  String content = inputFile.readAsStringSync();
  print('Original file content:\n$content');

  // Capitalize each word line by line
  var lines = content.split('\n');
  for (int i = 0; i < lines.length; i++) {
    lines[i] = capitalizeWords(lines[i]);
  }
  String result = lines.join('\n');

  outputFile.writeAsStringSync(result);

  print('\nCapitalized content saved to output.txt:\n$result');
}
