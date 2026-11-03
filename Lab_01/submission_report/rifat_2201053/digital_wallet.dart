// Base Account Class
class BankAccount {
  double _accBalance = 0.0; // Private balance variable

  // Public getter for reading balance
  double get balance => _accBalance;

  void deposit(double amount) {
    if (amount <= 0) {
      print("Invalid deposit! Amount should be positive.");
      return;
    }
    _accBalance += amount;
    print("Deposited: \$$amount | Available Balance: \$$_accBalance");
  }
}

// Premium Account Class inheriting BankAccount
class PremiumAccount extends BankAccount {
  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print("Invalid deposit! Amount should be positive.");
      return;
    }
    // Calculate 5% cashback
    double cashback = amount * 0.05;
    print("[Cashback] 5% bonus added: \$$cashback");
    super.deposit(amount + cashback);
  }
}

void main() {
  print("=== Testing Standard Account ===");
  var myAccount = BankAccount();
  myAccount.deposit(2000.0);
  print("Current balance: \$${myAccount.balance}\n");

  print("=== Testing Premium Account ===");
  var myPremium = PremiumAccount();
  myPremium.deposit(2000.0); // 2000 + 100 cashback = 2100
  print("Current balance: \$${myPremium.balance}");
}

