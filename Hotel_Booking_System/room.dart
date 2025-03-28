import 'dart:math';

class Room {
  final String id;
  final int roomNumber;
  final double price;
  bool isAvailable;

  Room(this.roomNumber, this.price, {this.isAvailable = true}) : id = _generateId() {
    if (price <= 0) {
      throw ArgumentError("Price must be greater than zero.");
    }
  }

  static String _generateId() {
    return "RM${Random().nextInt(10000)}"; 
  }

  void bookRoom() {
    if (isAvailable) {
      isAvailable = false;
      print("Room $roomNumber has been booked.");
    } else {
      print("Room $roomNumber is already booked.");
    }
  }

  void cancelBooking() {
    if (!isAvailable) {
      isAvailable = true;
      print("Booking for Room $roomNumber has been canceled.");
    } else {
      print("Room $roomNumber is already available.");
    }
  }


  String roomInfo() {
    return "Room ID: $id, Number: $roomNumber, Price: \$${price.toStringAsFixed(2)}, Available: $isAvailable";
  }
}
