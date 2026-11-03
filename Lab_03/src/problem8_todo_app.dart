// Lab 03 - Problem 8: Create a simple to-do application that allows user to add, remove, and view their task.

import 'dart:io';

class TodoApp {
  final List<String> _tasks = [];

  // Method to add a new task
  void addTask(String task) {
    String trimmed = task.trim();
    if (trimmed.isNotEmpty) {
      _tasks.add(trimmed);
      print('[+] Success: Task "$trimmed" added to list.');
    } else {
      print('[-] Error: Task description cannot be empty.');
    }
  }

  // Method to remove a task by its 1-based index
  bool removeTask(int taskNumber) {
    if (taskNumber >= 1 && taskNumber <= _tasks.length) {
      String removed = _tasks.removeAt(taskNumber - 1);
      print('[+] Success: Task #$taskNumber ("$removed") has been removed.');
      return true;
    } else {
      print('[-] Error: Invalid task number. Please enter a number between 1 and ${_tasks.length}.');
      return false;
    }
  }

  // Method to view all active tasks
  void viewTasks() {
    print('\n================ CURRENT TO-DO LIST ================');
    if (_tasks.isEmpty) {
      print('  (Your to-do list is empty! Add tasks to get started)');
    } else {
      for (int i = 0; i < _tasks.length; i++) {
        print('  [${i + 1}] ${_tasks[i]}');
      }
    }
    print('====================================================\n');
  }

  // Method to run automated demo for testing
  void runDemo() {
    print('========================================');
    print('   To-Do Application Demonstration      ');
    print('========================================');
    
    print('\n--- 1. Viewing Initial Empty List ---');
    viewTasks();

    print('--- 2. Adding Tasks ---');
    addTask('Complete IRE 460 Lab Report 03');
    addTask('Study Flutter Widget Lifecycle');
    addTask('Prepare IoT Project Presentation');

    print('\n--- 3. Viewing List After Additions ---');
    viewTasks();

    print('--- 4. Removing Task #2 ("Study Flutter Widget Lifecycle") ---');
    removeTask(2);

    print('\n--- 5. Viewing Final List ---');
    viewTasks();
  }

  // Interactive CLI loop
  void runInteractive() {
    print('========================================');
    print('      CLI TO-DO APPLICATION SYSTEM      ');
    print('========================================');

    while (true) {
      print('\nChoose an action:');
      print('1. View Tasks');
      print('2. Add Task');
      print('3. Remove Task');
      print('4. Exit');
      stdout.write('Enter your choice (1-4): ');

      String? choice = stdin.readLineSync()?.trim();

      switch (choice) {
        case '1':
          viewTasks();
          break;
        case '2':
          stdout.write('Enter new task description: ');
          String? task = stdin.readLineSync();
          if (task != null) addTask(task);
          break;
        case '3':
          viewTasks();
          if (_tasks.isNotEmpty) {
            stdout.write('Enter task number to remove: ');
            int? num = int.tryParse(stdin.readLineSync() ?? '');
            if (num != null) {
              removeTask(num);
            } else {
              print('[-] Error: Please enter a valid numerical index.');
            }
          }
          break;
        case '4':
          print('\nExiting To-Do Application. Have a productive day!');
          return;
        default:
          print('[-] Invalid selection. Please choose an option from 1 to 4.');
      }
    }
  }
}

void main(List<String> args) {
  final app = TodoApp();
  if (args.contains('--demo')) {
    app.runDemo();
  } else {
    app.runInteractive();
  }
}
