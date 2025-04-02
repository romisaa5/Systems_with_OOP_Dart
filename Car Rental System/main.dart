
import 'admin.dart';
import 'booking.dart';
import 'car.dart';
import 'customer.dart';

void main() {
  var car1 = Car("Model S", "Tesla", 101, 150.0, true);
  var car2 = Car("Corolla", "Toyota", 102, 80.0, true); 

  var customer1 = Customer("John Doe", "0123456789");

  var admin = Admin();
  admin.addCar(car1);
  admin.addCar(car2);

  admin.displayAllCars();
  admin.displayAvailableCars();

  var booking1 = Booking(1, customer1, car1, false, 3);
  booking1.completePayment();


  var foundCar = admin.searchCarById(101);
  if (foundCar != null) {
    print("\nCar Found:");
    foundCar.displayInfo();
  } else {
    print("\nCar not found.");
  }

  admin.removeCar(102);
  admin.displayAllCars();


  var booking2 = Booking(2, customer1, car2, false, 2);
  booking2.cancelBooking();
  admin.displayAvailableCars();
}
