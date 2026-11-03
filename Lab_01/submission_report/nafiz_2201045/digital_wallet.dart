// Base BankAccount class
class BankAccount {
  double _currentBalance = 0.0; // private balance field

  // Getter to read balance safely
  double get balance => _currentBalance;

  void deposit(double amount) {
    if (amount > 0) {
      _currentBalance += amount;
      print("Successfully deposited: \$$amount | Total: \$$_currentBalance");
    } else {
      print("Error: Deposit amount must be greater than 0");
    }
  }
}

// Premium account subclass
class PremiumAccount extends BankAccount {
  @override
  void deposit(double amount) {
    if (amount > 0) {
      double reward = amount * 0.05; // 5% bonus reward
      print("Reward earned: \$$reward (5% cashback)");
      super.deposit(amount + reward);
    } else {
      print("Error: Deposit amount must be greater than 0");
    }
  }
}

void main() {
  print("--- Standard Account Demo ---");
  BankAccount standard = BankAccount();
  standard.deposit(500);
  print("Final Balance: \$${standard.balance}\n");

  print("--- Premium Account Demo ---");
  PremiumAccount premium = PremiumAccount();
  premium.deposit(500);
  print("Final Balance: \$${premium.balance}");
}

