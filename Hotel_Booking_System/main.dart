class Hotel {
  String name;
  List<Room> rooms = [];
  Hotel(this.name);
  
  void addRoom(Room room) {
    rooms.add(room);
  }

  void showAvailableRooms() {
    print("Available Rooms: ");
    for (var room in rooms) {
      if (room.isAvailable) {
        print("Room ${room.roomNumber} - Price: ${room.price}");
      }
    }
  }
}

class Room {
  int roomNumber;
  double price;
  bool isAvailable;
  
  Room(this.roomNumber, this.price, {this.isAvailable = true});
  
  void bookRoom() {
    if (isAvailable) {
      isAvailable = false;
      print("Room $roomNumber has been booked.");
    } else {
      print("Room $roomNumber is already booked.");
    }
  }

  void cancelBooking() {
    isAvailable = true;
    print("Booking for Room $roomNumber has been canceled.");
  }
}

class User {
  String name;
  List<Booking> bookings = []; 

  User(this.name);

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

  void cancelBooking(Booking booking) {
    if (bookings.contains(booking)) {
      booking.cancelBooking();
      bookings.remove(booking);
      print("$name canceled booking for Room ${booking.room.roomNumber}.");
    }
  }
}

class Booking {
  User user;
  Room room;
  DateTime bookingDate;

  Booking({required this.user, required this.room}) : bookingDate = DateTime.now();

  void cancelBooking() {
    room.cancelBooking();
    print("${user.name} canceled booking for Room ${room.roomNumber}.");
  }
}

void main() {
  Hotel hotel = Hotel("Grand Hotel");

  Room room1 = Room(101, 100);
  Room room2 = Room(102, 150);
  Room room3 = Room(103, 200);

  hotel.addRoom(room1);
  hotel.addRoom(room2);
  hotel.addRoom(room3);

  hotel.showAvailableRooms();

  User user1 = User("Ali");

  user1.makeBooking(room1);
  user1.makeBooking(room1);

  hotel.showAvailableRooms();

  user1.cancelBooking(user1.bookings.first);

  hotel.showAvailableRooms();
}
