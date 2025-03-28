import 'room.dart';
import 'user.dart';
import 'dart:math';

class Booking {
  final String id;
  final User user;
  final Room room;
  final DateTime bookingDate;
  String status;

  Booking({required this.user, required this.room})
      : id = _generateId(),
        bookingDate = DateTime.now(),
        status = "confirmed";

  static String _generateId() {
    return "BK${Random().nextInt(10000)}"; 
  }

  void cancelBooking() {
    if (status == "canceled") {
      print("Booking already canceled.");
      return;
    }

    room.cancelBooking();
    status = "canceled";
    print("${user.name} canceled booking for Room ${room.roomNumber}.");
  }


  String bookingInfo() {
    return "Booking ID: $id, User: ${user.name}, Room: ${room.roomNumber}, Status: $status, Date: $bookingDate";
  }
}
