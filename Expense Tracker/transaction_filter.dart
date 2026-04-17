import 'transaction.dart';

class TransactionFilter {
  List<Transaction> filterByCategory(
    List<Transaction> transactions,
    String category,
  ) {
    return transactions.where((t) => t.category == category).toList();
  }

  List<Transaction> filterByDateRange(
    List<Transaction> transactions,
    DateTime start,
    DateTime end,
  ) {
    return transactions.where((t) {
      return t.date.isAfter(start) && t.date.isBefore(end);
    }).toList();
  }
}
