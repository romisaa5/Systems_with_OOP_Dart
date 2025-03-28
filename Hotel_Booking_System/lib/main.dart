import 'hotel.dart';
import 'room.dart';
import 'user.dart';
import 'admin.dart';
import 'payment.dart';
import 'review.dart';

void main() {
  Hotel hotel = Hotel("Grand Hotel");

  Admin admin = Admin("Manager", hotel);
  admin.addRoom(Room(101, 100));
  admin.addRoom(Room(102, 150));
  admin.addRoom(Room(103, 200));

  hotel.showAvailableRooms();

  User user1 = User("Ali", "U001");

 
  user1.makeBooking(hotel.rooms[0]);

 
  if (user1.bookings.isNotEmpty) {
    Payment payment = Payment(user: user1, booking: user1.bookings.first);
    payment.makePayment();
  }


  Review review = Review(user: user1, comment: "Great hotel with amazing service!", rating: 5);
  review.showReview();

 
  admin.showAllRooms();

  admin.removeRoom(102);
  hotel.showAvailableRooms();
}
