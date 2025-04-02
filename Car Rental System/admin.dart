import 'car.dart';

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