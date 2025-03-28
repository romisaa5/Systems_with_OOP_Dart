import 'booking.dart';
import 'room.dart';

class User {
  String name;
  final String id;
  List<Booking> bookings;

  User(this.name, this.id) : bookings = [] {
    if (name.isEmpty) {
      throw ArgumentError("User name cannot be empty.");
    }
  }

  void makeBooking(Room room) {
    if (room.isAvailable) {
      Booking booking = Booking(user: this, room: room);
      bookings.add(booking);
      room.bookRoom();
      print("$name booked Room ${room.roomNumber}.");
    } else {
      print("Room ${room.roomNumber} is not available.");
    }
  }

 void cancelBooking(int roomNumber) {
  try {
    Booking bookingToCancel =
        bookings.firstWhere((b) => b.room.roomNumber == roomNumber);

    bookingToCancel.cancelBooking();
    bookings.remove(bookingToCancel);
    print("$name canceled booking for Room ${bookingToCancel.room.roomNumber}.");
  } catch (e) {
    print("No booking found for Room $roomNumber.");
  }
}

void listBookings() {
    if (bookings.isEmpty) {
      print("🔹 $name has no bookings.");
    } else {
      print("🔹 $name's bookings:");
      for (var booking in bookings) {
        print("- Room ${booking.room.roomNumber} (Booked on ${booking.bookingDate})");
      }
    }
  }
}
