
import 'bankacount.dart';
import 'transaction.dart';

class ATM {
  String language;

  ATM({required this.language});

  void performTransaction(Transaction transaction, BankAccount account) {
    transaction.execute(account, language);
  }
}