enum TransactionType { income, expense }

class Transaction {
  String id;
  double amount;
  String title;
  DateTime date;
  TransactionType type;
  String category;

  Transaction({
    required this.id,
    required this.amount,
    required this.title,
    required this.date,
    required this.type,
    required this.category,
  });
}
