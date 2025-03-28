import 'room.dart';
import 'dart:math';

class Hotel {
  final String id;
  final String name;
  final List<Room> rooms;

  Hotel(this.name) : id = _generateId(), rooms = [] {
    if (name.isEmpty) {
      throw ArgumentError("Hotel name cannot be empty.");
    }
  }

  static String _generateId() {
    return "HT${Random().nextInt(10000)}";
  }

  void addRoom(Room room) {
    if (rooms.any((r) => r.roomNumber == room.roomNumber)) {
      print("❌ Room ${room.roomNumber} already exists in $name.");
      return;
    }
    rooms.add(room);
    print("✅ Room ${room.roomNumber} added to $name.");
  }

  void removeRoom(int roomNumber) {
    Room? roomToRemove = rooms.firstWhere(
      (room) => room.roomNumber == roomNumber,
      orElse: () => Room(-1, 0, isAvailable: false),
    );

    if (roomToRemove.roomNumber == -1) {
      print("❌ Room $roomNumber not found in $name.");
      return;
    }

    rooms.remove(roomToRemove);
    print(" Room $roomNumber removed from $name.");
  }

  void showAvailableRooms() {
    var availableRooms = rooms.where((room) => room.isAvailable).toList();

    if (availableRooms.isEmpty) {
      print("⚠️ No available rooms in $name.");
      return;
    }

    print("🏨 Available Rooms in $name:");
    for (var room in availableRooms) {
      print("- Room ${room.roomNumber} | Price: \$${room.price.toStringAsFixed(2)}");
    }
  }

  Room? getRoomByNumber(int roomNumber) {
    return rooms.firstWhere(
      (room) => room.roomNumber == roomNumber,
      orElse: () => Room(-1, 0, isAvailable: false),
    );
  }

  @override
  String toString() {
    return "🏨 Hotel ID: $id, Name: $name, Total Rooms: ${rooms.length}";
  }
}
