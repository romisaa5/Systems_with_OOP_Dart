


import 'car.dart';
import 'customer.dart';

class Booking {
  final int bookId;
  final Customer customer;
  final Car car;
  bool isPaid;
  final int days;
  double totalPrice;

  Booking(this.bookId, this.customer, this.car, this.isPaid, this.days)
      : totalPrice = days * car.priceForDay {
    car.isAvailable = false; 
  }

  void completePayment() {
    if (!isPaid) {
      isPaid = true;
      print(
          "Payment completed for Booking ID: $bookId, Total: \$${totalPrice.toStringAsFixed(2)}");
    } else {
      print("Payment already completed.");
    }
  }

  void cancelBooking() {
    if (!isPaid) {
      car.isAvailable = true; 
      print("Booking ID: $bookId has been canceled. Car is now available.");
    } else {
      print("Cannot cancel a paid booking.");
    }
  }
}

