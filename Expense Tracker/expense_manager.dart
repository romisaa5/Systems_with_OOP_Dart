import 'transaction.dart';

class ExpenseManager {
  List<Transaction> _transactions = [];

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
  }

  void deleteTransaction(String id) {
    _transactions.removeWhere((t) => t.id == id);
  }

  void updateTransaction(Transaction updatedTransaction) {
    int index = _transactions.indexWhere((t) => t.id == updatedTransaction.id);

    if (index != -1) {
      _transactions[index] = updatedTransaction;
    }
  }

  List<Transaction> getAllTransactions() {
    return _transactions;
  }

  List<Transaction> getTransactionsByMonth(int month, int year) {
    return _transactions.where((t) {
      return t.date.month == month && t.date.year == year;
    }).toList();
  }

  double getTotalExpenses() {
    return _transactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double getTotalIncome() {
    return _transactions
        .where((t) => t.type == TransactionType.income)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double getBalance() {
    return getTotalIncome() - getTotalExpenses();
  }
}
