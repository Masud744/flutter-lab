// Lab 03 - Problem 5: Read data from a file and capitalized each word and write the result in separate file.
// Both file should be in same format.

import 'dart:io';

String capitalizeWords(String text) {
  // Splits line into words, capitalizes first character of each word
  return text.split(' ').map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}

void main() {
  print('========================================');
  print(' Problem 5: File Word Capitalization   ');
  print('========================================');

  // Resolve directory of the current script to allow running from any folder
  final scriptDir = File(Platform.script.toFilePath()).parent.path;
  final inputFile = File('$scriptDir/input.txt');
  final outputFile = File('$scriptDir/output.txt');

  if (!inputFile.existsSync()) {
    inputFile.writeAsStringSync(
      'mobile platform for iot devices sessional\n'
      'learning flutter and dart collection libraries\n'
      'file input output operations in dart programming\n',
    );
  }

  // Reading original content
  String content = inputFile.readAsStringSync();
  print('\n[1] Original content from "input.txt":');
  print('----------------------------------------');
  print(content.trim());
  print('----------------------------------------');

  // Processing and capitalizing each word per line
  List<String> lines = content.split('\n');
  List<String> processedLines = lines.map((line) => capitalizeWords(line)).toList();
  String capitalizedResult = processedLines.join('\n');

  // Writing output to separate file in the same (.txt) format
  outputFile.writeAsStringSync(capitalizedResult);

  // Reading and displaying the result
  print('\n[2] Processed content written to "output.txt":');
  print('----------------------------------------');
  print(outputFile.readAsStringSync().trim());
  print('----------------------------------------');

  print('\n[SUCCESS] Successfully processed file and saved capitalized data to output.txt');
}
