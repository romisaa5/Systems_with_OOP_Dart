import 'hotel.dart';
import 'room.dart';

class Admin {
  final String name;
  final Hotel hotel;

  Admin(this.name, this.hotel);

  void addRoom(Room room) {
    hotel.addRoom(room);
    print("🛏️ Admin $name added Room ${room.roomNumber}.");
  }

  void removeRoom(int roomNumber) {
    hotel.removeRoom(roomNumber);
    print("🗑️ Admin $name removed Room $roomNumber.");
  }

  void showAllRooms() {
    print("📋 All rooms managed by $name:");
    for (var room in hotel.rooms) {
      print("- Room ${room.roomNumber} | Price: \$${room.price} | ${room.isAvailable ? 'Available' : 'Booked'}");
    }
  }
}
