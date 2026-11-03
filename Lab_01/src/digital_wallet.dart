// ==============================================================================
// Course Code: IRE 460 | Mobile Platform for IoT Devices Sessional
// Lab Task: Digital Wallet Backend System
// Student Name: Shahriar Alom Masud | ID: 2201032
// ==============================================================================

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
