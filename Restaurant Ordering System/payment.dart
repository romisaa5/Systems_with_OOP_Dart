abstract class Payment {
  double amount;

  Payment(this.amount);

  void processPayment();
}

class CashPayment extends Payment {
  CashPayment(double amount) : super(amount);

  @override
  void processPayment() {
    print("Paid $amount in cash");
  }
}

class CardPayment extends Payment {
  String cardNumber;

  CardPayment(double amount, this.cardNumber) : super(amount);

  @override
  void processPayment() {
    print("Paid $amount using card $cardNumber");
  }
}
