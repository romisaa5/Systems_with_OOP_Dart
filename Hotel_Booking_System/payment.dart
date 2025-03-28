import 'user.dart';
import 'booking.dart';

class Payment {
  final User user;
  final Booking booking;
  final double amount;
  bool isPaid;

  Payment({required this.user, required this.booking})
      : amount = booking.room.price,
        isPaid = false;

  void makePayment() {
    if (!isPaid) {
      isPaid = true;
      print("💳 Payment of \$${amount} made by ${user.name} for Room ${booking.room.roomNumber}.");
    } else {
      print("❌ Payment already completed for this booking.");
    }
  }
}
