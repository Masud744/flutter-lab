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
// Base class demonstrating Encapsulation
class BankAccount {
  // Private field
  double _balance = 0.0;

  // Public getter to read balance
  double get balance => _balance;

  // Method to deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: \$${amount.toStringAsFixed(2)} | New Balance: \$${_balance.toStringAsFixed(2)}');
    } else {
      print('Invalid deposit amount.');
    }
  }
}

// Subclass demonstrating Inheritance and Polymorphism
class PremiumAccount extends BankAccount {
  // Overriding deposit method to add 5% cash-back bonus automatically
  @override
  void deposit(double amount) {
    if (amount > 0) {
      double bonus = amount * 0.05; // 5% cash-back
      print('Premium Reward: 5% Cash-Back Bonus of \$${bonus.toStringAsFixed(2)} added!');
      super.deposit(amount + bonus);
    } else {
      print('Invalid deposit amount.');
    }
  }
}

void main() {
  print('--- Testing Standard Account ---');
  BankAccount standard = BankAccount();
  standard.deposit(1000.0);
  print('Final Standard Account Balance: \$${standard.balance.toStringAsFixed(2)}\n');

  print('--- Testing Premium Account ---');
  PremiumAccount premium = PremiumAccount();
  premium.deposit(1000.0);
  print('Final Premium Account Balance: \$${premium.balance.toStringAsFixed(2)}');
}
```

---

## Output

```text
--- Testing Standard Account ---
Deposited: $1000.00 | New Balance: $1000.00
Final Standard Account Balance: $1000.00

--- Testing Premium Account ---
Premium Reward: 5% Cash-Back Bonus of $50.00 added!
Deposited: $1050.00 | New Balance: $1050.00
Final Premium Account Balance: $1050.00
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
