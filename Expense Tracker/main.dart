import 'expense_manager.dart';
import 'transaction.dart';

void main() {
  var manager = ExpenseManager();

  manager.addTransaction(
    Transaction(
      id: "1",
      amount: 5000,
      title: "Salary",
      date: DateTime.now(),
      type: TransactionType.income,
      category: "Job",
    ),
  );

  manager.addTransaction(
    Transaction(
      id: "2",
      amount: 200,
      title: "Food",
      date: DateTime.now(),
      type: TransactionType.expense,
      category: "Food",
    ),
  );

  print("Income: ${manager.getTotalIncome()}");
  print("Expenses: ${manager.getTotalExpenses()}");
  print("Balance: ${manager.getBalance()}");
}
