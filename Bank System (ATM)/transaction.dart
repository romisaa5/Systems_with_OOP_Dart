import 'bankacount.dart';

abstract class Transaction {
  void execute(BankAccount account, String language);
}

class CheckBalanceTransaction extends Transaction {
  @override
  void execute(BankAccount account, String language) {
    account.checkBalance(language);
  }
}

class WithdrawTransaction extends Transaction {
  double amount;
  WithdrawTransaction(this.amount);
  @override
  void execute(BankAccount account, String language) {
    if (amount > account.balance) {
      print(language == "ar" ? "❌ رصيد غير كافٍ!" : " Insufficient funds! ❌");
    } else {
      account.updateBalance(-amount);
      print(language == "ar"
          ? "✅ تم السحب: \$${amount} , رصيدك المتبقي :\$${account.balance}"
          : "Withdrawal successful: \$${amount} ✅ ,Your remaining balance : \$${account.balance} ");
    }
  }
}

class DepositTransaction extends Transaction {
  double amount;
  DepositTransaction(this.amount);
  @override
  void execute(BankAccount account, String language) {
    account.updateBalance(amount);
    print(language == "ar"
        ? "✅ تم الإيداع: \$${amount}رصيدك الحالي :\$${account.balance.toStringAsFixed(2)}"
        : "Deposit successful: \$${amount} ✅, Your new balance: \$${account.balance.toStringAsFixed(2)} ");
  }
}
