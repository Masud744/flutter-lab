# Lab 01: Digital Wallet Backend System

Course Code: IRE 460  
Course Title: Mobile Platform for IoT Devices Sessional  
Department: Department of Internet of Things and Robotics Engineering (IRE)  
Faculty: Faculty of Cyber Physical System Engineering  
Institution: University of Frontier Technology, Bangladesh (UFTB)  

Author: Shahriar Alom Masud  
Student ID: 2201032  
Session: 2022-2023  
Instructor: Md. Rafiqul Islam, Lecturer, Dept. of IRE, UFTB  

---

## Problem Statement

You need to create a simple backend system for a Digital Wallet app that handles two types of accounts: **Standard Accounts** and **Premium Accounts**. Premium users earn cash-back rewards whenever they deposit money.

## Architecture Requirements

### 1. Encapsulation (`BankAccount` class):
- Create a base class `BankAccount`.
- Keep the `_balance` field private.
- Provide a public getter to read the balance, but do not allow direct modifications from outside the class.
- Implement a `deposit(double amount)` method.

### 2. Inheritance & Polymorphism (`PremiumAccount` class):
- Create a subclass `PremiumAccount` that extends `BankAccount`.
- Override the `deposit(double amount)` method so that premium users get an extra **5% cash-back bonus** added to their deposit automatically.

---

## Source Code (`Lab_01/src/digital_wallet.dart`)

```dart
// Base class for bank account
class BankAccount {
  double _balance = 0.0; // private variable

  // public getter to check balance
  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: \$$amount | Total Balance: \$$_balance");
    } else {
      print("Please enter a valid deposit amount.");
    }
  }
}

// Premium account with 5% cashback
class PremiumAccount extends BankAccount {
  @override
  void deposit(double amount) {
    if (amount > 0) {
      double bonus = amount * 0.05; // 5% cashback
      print("Cashback bonus: \$$bonus");
      super.deposit(amount + bonus);
    } else {
      print("Please enter a valid deposit amount.");
    }
  }
}

void main() {
  print("--- Testing Standard Account ---");
  var acc1 = BankAccount();
  acc1.deposit(1000);
  print("Account balance: \$${acc1.balance}\n");

  print("--- Testing Premium Account ---");
  var acc2 = PremiumAccount();
  acc2.deposit(1000); // 50 bonus will be added automatically
  print("Account balance: \$${acc2.balance}");
}
```

---

## Output

```text
--- Testing Standard Account ---
Deposited: $1000.0 | Total Balance: $1000.0
Account balance: $1000.0

--- Testing Premium Account ---
Cashback bonus: $50.0
Deposited: $1050.0 | Total Balance: $1050.0
Account balance: $1050.0
```

---

## Running the Code

```bash
dart run src/digital_wallet.dart
```

To compile the PDF report:
```bash
cd submission_report
bash build.sh
```
Output PDF: `submission_report/2201032_Report_1.pdf`
