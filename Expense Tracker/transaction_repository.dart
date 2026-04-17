import 'transaction.dart';

abstract class TransactionRepository {
  void add(Transaction transaction);
  void delete(String id);
  void update(Transaction transaction);
  List<Transaction> getAll();
}

class InMemoryTransactionRepository implements TransactionRepository {
  final List<Transaction> _storage = [];

  @override
  void add(Transaction transaction) {
    _storage.add(transaction);
  }

  @override
  void delete(String id) {
    _storage.removeWhere((t) => t.id == id);
  }

  @override
  void update(Transaction transaction) {
    int index = _storage.indexWhere((t) => t.id == transaction.id);
    if (index != -1) {
      _storage[index] = transaction;
    }
  }

  @override
  List<Transaction> getAll() {
    return _storage;
  }
}
