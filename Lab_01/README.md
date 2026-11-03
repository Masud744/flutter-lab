# Lab 01: Digital Wallet Backend System (Encapsulation, Inheritance & Polymorphism in Dart)

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

## Problem Statement & Architecture Requirements

You need to create a simple backend system for a Digital Wallet app that handles two types of accounts: **Standard Accounts** and **Premium Accounts**. Premium users earn cash-back rewards whenever they deposit money.

### Architectural Requirements:
1. **Encapsulation (`BankAccount` class):**
   - Create a base class `BankAccount`.
   - Keep the `_balance` field private.
   - Provide a public getter to read the balance, but do not allow direct modifications from outside the class.
   - Implement a `deposit(double amount)` method.

2. **Inheritance & Polymorphism (`PremiumAccount` class):**
   - Create a subclass `PremiumAccount` that extends `BankAccount`.
   - Override the `deposit(double amount)` method so that premium users get an extra **5% cash-back bonus** added to their deposit automatically.

---

## Project Structure

```text
Lab_01/
├── src/
│   ├── digital_wallet.dart          # Main Dart implementation of Digital Wallet backend
│   ├── task1.dart
│   └── task2.dart
├── submission_report/
│   ├── build.sh                     # 1-Click build script for compiling the report
│   ├── main.tex                     # LaTeX source with UFTB cover, UML & code listing
│   ├── 2201032_Report_1.pdf         # Final compiled submission-ready PDF report
│   └── screenshots/
│       └── uftb_logo.png            # Official institutional insignia
└── README.md
```

---

## Running the Code

### 1. Run Digital Wallet Backend
```bash
dart run src/digital_wallet.dart
```

### 2. Build PDF Lab Report
```bash
cd submission_report
bash build.sh
```
The compiled PDF report will be generated at:
`submission_report/2201032_Report_1.pdf`

---

## Verification Test Summary

| Scenario | Account Type | Initial ($) | Deposit ($) | Bonus ($) | Final Balance ($) |
| :--- | :--- | :---: | :---: | :---: | :---: |
| 1. Standard Deposit | `BankAccount` | 100.00 | 500.00 | 0.00 | 600.00 |
| 2. Premium Deposit | `PremiumAccount` | 100.00 | 500.00 | +25.00 (+5%) | 625.00 |
| 3. Polymorphic Batch | `List<BankAccount>` | 200.00 | 400.00 | Dynamic | Unified processing |
| 4. Validation Rejection | Both | - | 0.00 / -75.00 | Rejected | Protected balance |
