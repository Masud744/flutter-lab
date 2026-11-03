import 'dart:io';

void main() {
  List<String> tasks = [];

  while (true) {
    print('\n--- To-Do App ---');
    print('1. View Tasks');
    print('2. Add Task');
    print('3. Remove Task');
    print('4. Exit');
    stdout.write('Enter choice (1-4): ');

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      if (tasks.isEmpty) {
        print('No tasks available.');
      } else {
        print('\nYour Tasks:');
        for (int i = 0; i < tasks.length; i++) {
          print('${i + 1}. ${tasks[i]}');
        }
      }
    } else if (choice == '2') {
      stdout.write('Enter task: ');
      String? task = stdin.readLineSync();
      if (task != null && task.trim().isNotEmpty) {
        tasks.add(task.trim());
        print('Task added.');
      }
    } else if (choice == '3') {
      if (tasks.isEmpty) {
        print('No tasks to remove.');
      } else {
        stdout.write('Enter task number to remove: ');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null && index >= 1 && index <= tasks.length) {
          String removed = tasks.removeAt(index - 1);
          print('Removed: $removed');
        } else {
          print('Invalid task number.');
        }
      }
    } else if (choice == '4') {
      print('Goodbye!');
      break;
    } else {
      print('Invalid option. Please choose 1-4.');
    }
  }
}
