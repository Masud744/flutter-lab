# Lab 03: Dart Collections, File Handling & CLI Application

**Course Code:** IRE 460  
**Course Title:** Mobile Platform for IoT Devices Sessional  
**Department:** Department of Internet of Things and Robotics Engineering (IRE)  
**Faculty:** Faculty of Cyber Physical System Engineering  
**Institution:** University of Frontier Technology, Bangladesh (UFTB)  

**Student Name:** Shahriar Alom Masud  
**Student ID:** 2201032  
**Session:** 2022–2023  
**Instructor:** Md. Rafiqul Islam, Lecturer, Dept. of IRE, UFTB  

---

## Overview

This laboratory module focuses on fundamental data structures (Collections: `List`, `Set`, `Map`), File I/O operations (`File`), and interactive console programming in Dart.

## Problem Statements and Solutions

### Problem 1: List of Names
* **Description:** Create a list of names and print all names using list.
* **File:** [`src/problem1_names_list.dart`](src/problem1_names_list.dart)
* **Execution:** `dart run src/problem1_names_list.dart`

```dart
void main() {
  List<String> names = ['Shahriar', 'Masud', 'Rafiqul', 'Tanvir', 'Sakib'];
  print(names);
  for (int i = 0; i < names.length; i++) {
    print('${i + 1}. ${names[i]}');
  }
}
```

---

### Problem 2: Set of Fruits
* **Description:** Create a set of fruits and print all fruits using loop.
* **File:** [`src/problem2_fruits_set.dart`](src/problem2_fruits_set.dart)
* **Execution:** `dart run src/problem2_fruits_set.dart`

```dart
void main() {
  Set<String> fruits = {'Apple', 'Banana', 'Mango', 'Orange', 'Strawberry', 'Pineapple'};
  int index = 1;
  for (String fruit in fruits) {
    print('$index. $fruit');
    index++;
  }
}
```

---

### Problem 3: Expenses Total Calculator
* **Description:** Create a program that reads list of expenses amount using user input and print total.
* **File:** [`src/problem3_expenses.dart`](src/problem3_expenses.dart)
* **Execution:** `dart run src/problem3_expenses.dart`

---

### Problem 4: Days of the Week List
* **Description:** Create an empty list of type string called `days`. Use the `add` method to add names of 7 days and print all days.
* **File:** [`src/problem4_days_list.dart`](src/problem4_days_list.dart)
* **Execution:** `dart run src/problem4_days_list.dart`

---

### Problem 5: File Word Capitalization
* **Description:** Read data from a file and capitalize each word and write the result in a separate file. Both files should be in the same format.
* **File:** [`src/problem5_file_capitalize.dart`](src/problem5_file_capitalize.dart)
* **Input File:** [`src/input.txt`](src/input.txt)
* **Output File:** [`src/output.txt`](src/output.txt)
* **Execution:** `dart run src/problem5_file_capitalize.dart`

---

### Problem 6: Person Map & Key Update
* **Description:** Create a map with `name`, `address`, `age`, `country` keys and store values to it. Update country name to other country and print all keys and values.
* **File:** [`src/problem6_person_map.dart`](src/problem6_person_map.dart)
* **Execution:** `dart run src/problem6_person_map.dart`

---

### Problem 7: Map Filtering with `where`
* **Description:** Create a map with contact names and phone keys and store some values to it. Use `where` to find all keys that have length 4.
* **File:** [`src/problem7_phone_map.dart`](src/problem7_phone_map.dart)
* **Execution:** `dart run src/problem7_phone_map.dart`

---

### Problem 8: Simple To-Do Application
* **Description:** Create a simple to-do application that allows the user to add, remove, and view their tasks.
* **File:** [`src/problem8_todo_app.dart`](src/problem8_todo_app.dart)
* **Execution:**
  - Interactive Mode: `dart run src/problem8_todo_app.dart`
  - Automated Demo: `dart run src/problem8_todo_app.dart --demo`

---

## Compiling PDF Report

To build the academic report:
```bash
cd submission_report
bash build.sh
```
Output: `submission_report/2201032_Report_3.pdf`

