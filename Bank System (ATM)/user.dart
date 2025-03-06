
import 'bankacount.dart';

class User {
  String name;
  int accountNumber;
  BankAccount bankAccount;

  User({
    required this.name,
    required this.accountNumber,
    required this.bankAccount,
  });

  @override
  String toString() {
    return "👤 User: $name | 🏦 Account Number: $accountNumber | 💰 Balance: \$${bankAccount.balance.toStringAsFixed(2)}";
  }
}
