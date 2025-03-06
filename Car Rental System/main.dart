class Car {
  final String model;
  final String brand;
  final int id;
  final double priceForDay;
  bool isAvailable;

  Car(this.model, this.brand, this.id, this.priceForDay, this.isAvailable);

  void displayInfo() {
    print(
        "Car's Brand: $brand, Model: $model, ID: $id, Price per Day: \$${priceForDay.toStringAsFixed(2)}, Available: $isAvailable");
  }
}

class Customer {
  final String name;
  final String phone;

  Customer(this.name, this.phone);

  void displayInfoCustomer() {
    print("Customer's Name: $name, Phone: $phone");
  }
}

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

class Admin {
  Map<int, Car> cars = {};

  void addCar(Car car) {
    cars[car.id] = car;
    print("Car added: ${car.brand} ${car.model}");
  }

  void removeCar(int carId) {
    if (cars.containsKey(carId)) {
      cars.remove(carId);
      print("Car ID: $carId has been removed.");
    } else {
      print("Car ID: $carId not found.");
    }
  }

  void displayAvailableCars() {
    print("\nAvailable Cars:");
    cars.values.where((car) => car.isAvailable).forEach((car) => car.displayInfo());
  }

  void displayAllCars() {
    print("\nAll Cars:");
    cars.values.forEach((car) => car.displayInfo());
  }

  Car? searchCarById(int carId) {
    return cars[carId];
  }
}

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
