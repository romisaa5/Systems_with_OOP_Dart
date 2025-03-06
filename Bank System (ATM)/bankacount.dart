import 'transaction.dart';

class BankAccount {
  int accountNumber;
  String accountName;
  String accountPassword;
  List<Transaction> transactionHistory = [];
  double balance;

  BankAccount({
    required this.accountName,
    required this.accountNumber,
    required this.accountPassword,
    required this.balance,
  });

  void updateBalance(double amount) {
    balance += amount;
  }

  void checkBalance(String language) {
    if (language == "ar") {
      print("\n💰 رصيدك الحالي: \$${balance.toStringAsFixed(2)}\n");
    } else {
      print("\n💰 Your current balance: \$${balance.toStringAsFixed(2)}\n");
    }
  }

  bool verifyPin(String enteredPin) {
    return enteredPin == accountPassword;
  }
}
