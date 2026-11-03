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
