abstract class Payment {
  pay(double amount);
}

class CreditCardPayment implements Payment {
  @override
  pay(double amount) {
 print("✅ Payment of \$${amount.toStringAsFixed(2)} completed using Credit Card.");
  }
}

class CashPayment implements Payment {
  @override
   void pay(double amount) {
    print("✅ Payment of \$${amount.toStringAsFixed(2)} received in cash.");
  }
}
