import 'package:flutter/material.dart';

// ==============================================================================
// OOP BACKEND ARCHITECTURE
// ==============================================================================

// Base class demonstrating Encapsulation
class BankAccount {
  double _balance = 0.0; // private balance variable

  // Public getter to access balance
  double get balance => _balance;

  // Deposit method
  bool deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      return true;
    }
    return false;
  }
}

// Subclass demonstrating Inheritance & Polymorphic Method Overriding
class PremiumAccount extends BankAccount {
  // Override deposit to add 5% cash-back automatically
  @override
  bool deposit(double amount) {
    if (amount > 0) {
      double bonus = amount * 0.05; // 5% cash-back bonus
      return super.deposit(amount + bonus);
    }
    return false;
  }
}

// ==============================================================================
// FLUTTER DIGITAL WALLET UI
// ==============================================================================

void main() {
  runApp(const DigitalWalletApp());
}

class DigitalWalletApp extends StatelessWidget {
  const DigitalWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      home: const WalletHomePage(),
    );
  }
}

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  // Instantiating the OOP backend accounts
  final BankAccount _standardAccount = BankAccount();
  final PremiumAccount _premiumAccount = PremiumAccount();

  final TextEditingController _stdController = TextEditingController();
  final TextEditingController _premController = TextEditingController();

  final List<String> _activityLogs = [];

  void _depositStandard() {
    final double? amount = double.tryParse(_stdController.text);
    if (amount != null && amount > 0) {
      setState(() {
        _standardAccount.deposit(amount);
        _activityLogs.insert(
          0,
          '[Standard Account] Deposited: \$${amount.toStringAsFixed(2)} | Balance: \$${_standardAccount.balance.toStringAsFixed(2)}',
        );
        _stdController.clear();
      });
    } else {
      _showError('Please enter a valid positive amount.');
    }
  }

  void _depositPremium() {
    final double? amount = double.tryParse(_premController.text);
    if (amount != null && amount > 0) {
      setState(() {
        double bonus = amount * 0.05;
        _premiumAccount.deposit(amount);
        _activityLogs.insert(
          0,
          '[Premium Account] Deposited: \$${amount.toStringAsFixed(2)} (+5% Bonus: \$${bonus.toStringAsFixed(2)}) | Balance: \$${_premiumAccount.balance.toStringAsFixed(2)}',
        );
        _premController.clear();
      });
    } else {
      _showError('Please enter a valid positive amount.');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Digital Wallet System',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Banner
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.indigo.shade200),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: Colors.indigo, size: 36),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IRE 460 - Mobile Platform for IoT Devices',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              'Lab 01: Encapsulation, Inheritance & Polymorphism in Dart',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Cards Row
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildStandardCard()),
                          const SizedBox(width: 16),
                          Expanded(child: _buildPremiumCard()),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _buildStandardCard(),
                          const SizedBox(height: 16),
                          _buildPremiumCard(),
                        ],
                      );
                    }
                  },
                ),

                const SizedBox(height: 28),

                // Transaction Logs
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.history, color: Colors.blueGrey),
                            SizedBox(width: 8),
                            Text(
                              'Live Transaction Activity',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(height: 24),
                        if (_activityLogs.isEmpty)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Text(
                                'No transactions yet. Make a deposit above!',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          )
                        else
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _activityLogs.length,
                            separatorBuilder: (context, index) => const Divider(height: 12),
                            itemBuilder: (context, index) {
                              final log = _activityLogs[index];
                              final isPremium = log.contains('[Premium');
                              return ListTile(
                                dense: true,
                                leading: Icon(
                                  isPremium ? Icons.stars : Icons.check_circle,
                                  color: isPremium ? Colors.amber.shade700 : Colors.teal,
                                ),
                                title: Text(
                                  log,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: isPremium ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStandardCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 8,
              children: [
                const Text(
                  'Standard Account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Regular',
                    style: TextStyle(fontSize: 12, color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text('Encapsulated Balance (via getter):', style: TextStyle(color: Colors.grey, fontSize: 13)),
            Text(
              '\$${_standardAccount.balance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _stdController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Deposit Amount',
                prefixText: '\$ ',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _depositStandard,
                icon: const Icon(Icons.add),
                label: const Text('Deposit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 8,
              children: [
                const Text(
                  'Premium Account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.workspace_premium, size: 14, color: Colors.amber.shade900),
                      const SizedBox(width: 4),
                      Text(
                        '5% Cash-Back',
                        style: TextStyle(fontSize: 12, color: Colors.amber.shade900, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text('Encapsulated Balance (via getter):', style: TextStyle(color: Colors.grey, fontSize: 13)),
            Text(
              '\$${_premiumAccount.balance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.amber.shade800),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _premController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Deposit Amount',
                prefixText: '\$ ',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _depositPremium,
                icon: const Icon(Icons.stars),
                label: const Text('Deposit (+5% Bonus)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
