// ==============================================================================
// Course Code: IRE 460 | Mobile Platform for IoT Devices Sessional
// Lab Task: Digital Wallet Backend System
// Topic: Encapsulation, Inheritance, and Polymorphism in Dart
// Author: Shahriar Alom Masud (ID: 2201032)
// Institution: University of Frontier Technology, Bangladesh (UFTB)
// ==============================================================================

/// Base class representing a standard bank account in the Digital Wallet system.
/// Demonstrates Encapsulation by shielding internal state [_balance].
class BankAccount {
  // Private field: cannot be accessed or modified directly outside this class/library
  double _balance;

  /// Constructor initializing account balance with boundary validation.
  BankAccount([double initialBalance = 0.0])
      : _balance = initialBalance >= 0 ? initialBalance : 0.0 {
    if (initialBalance < 0) {
      print('  [Warning] Initial balance cannot be negative. Defaulted to \$0.00.');
    }
  }

  /// Public getter to read the balance safely without allowing direct external modification.
  double get balance => _balance;

  /// Deposits a specified positive amount into the account.
  void deposit(double amount) {
    if (amount <= 0) {
      print('  [Error] Invalid deposit: \$${amount.toStringAsFixed(2)}. Amount must be greater than zero.');
      return;
    }
    _balance += amount;
    print('  [Deposit] Credited: \$${amount.toStringAsFixed(2)} | Current Balance: \$${_balance.toStringAsFixed(2)}');
  }
}

/// Subclass representing a premium bank account.
/// Demonstrates Inheritance and Polymorphic Method Overriding.
class PremiumAccount extends BankAccount {
  // 5% cash-back reward rate for premium deposits
  static const double cashBackRate = 0.05;

  /// Constructor forwarding initial balance to base class.
  PremiumAccount([super.initialBalance]);

  /// Overrides deposit to provide an automatic 5% cash-back reward.
  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print('  [Error] Invalid deposit: \$${amount.toStringAsFixed(2)}. Amount must be greater than zero.');
      return;
    }

    final double cashBackBonus = amount * cashBackRate;
    final double totalCredit = amount + cashBackBonus;

    print('  [Premium Reward] 5% Cash-Back Bonus: +\$${cashBackBonus.toStringAsFixed(2)} (Base: \$${amount.toStringAsFixed(2)})');
    // Leverage base class deposit to safely update the encapsulated balance
    super.deposit(totalCredit);
  }
}

void main() {
  print('======================================================================');
  print('        DIGITAL WALLET BACKEND SYSTEM - TEST & VERIFICATION           ');
  print('======================================================================\n');

  // ---------------------------------------------------------------------------
  // Scenario 1: Standard Account (Encapsulation Verification)
  // ---------------------------------------------------------------------------
  print('--- Scenario 1: Standard Account (Encapsulation & Deposit) ---');
  BankAccount standardAcc = BankAccount(100.0);
  print('Initial Balance (via getter): \$${standardAcc.balance.toStringAsFixed(2)}');
  
  print('Performing deposits:');
  standardAcc.deposit(500.0);
  standardAcc.deposit(250.0);
  print('Final Standard Account Balance: \$${standardAcc.balance.toStringAsFixed(2)}\n');

  // ---------------------------------------------------------------------------
  // Scenario 2: Premium Account (Inheritance & 5% Cash-Back Bonus)
  // ---------------------------------------------------------------------------
  print('--- Scenario 2: Premium Account (Inheritance & 5% Cash-Back) ---');
  PremiumAccount premiumAcc = PremiumAccount(100.0);
  print('Initial Balance (via getter): \$${premiumAcc.balance.toStringAsFixed(2)}');
  
  print('Performing deposits (eligible for 5% reward):');
  premiumAcc.deposit(500.0);  // Expected: $500 + $25 (bonus) = $525 credited -> Balance: $625
  premiumAcc.deposit(1000.0); // Expected: $1000 + $50 (bonus) = $1050 credited -> Balance: $1675
  print('Final Premium Account Balance: \$${premiumAcc.balance.toStringAsFixed(2)}\n');

  // ---------------------------------------------------------------------------
  // Scenario 3: Polymorphism Demonstration via Base Class Reference
  // ---------------------------------------------------------------------------
  print('--- Scenario 3: Polymorphism (Heterogeneous Collection) ---');
  List<BankAccount> walletAccounts = [
    BankAccount(200.0),
    PremiumAccount(200.0),
  ];

  double universalDeposit = 400.0;
  for (int i = 0; i < walletAccounts.length; i++) {
    BankAccount acc = walletAccounts[i];
    print('Processing Account #${i + 1} [Type: ${acc.runtimeType}]:');
    print('  Opening Balance: \$${acc.balance.toStringAsFixed(2)}');
    acc.deposit(universalDeposit); // Dynamic method dispatch at runtime
    print('  Closing Balance: \$${acc.balance.toStringAsFixed(2)}\n');
  }

  // ---------------------------------------------------------------------------
  // Scenario 4: Boundary & Input Validation Edge Cases
  // ---------------------------------------------------------------------------
  print('--- Scenario 4: Input Validation & Boundary Edge Cases ---');
  print('Attempting zero deposit on Standard Account:');
  standardAcc.deposit(0.0);

  print('Attempting negative deposit on Premium Account:');
  premiumAcc.deposit(-75.0);

  print('\n======================================================================');
  print('                 ALL VERIFICATION TESTS COMPLETED                     ');
  print('======================================================================');
}
