class Car {
  final String model;
  final String brand;
  final int id;
  final double priceForDay;
  bool isAvailable;

  Car(this.model, this.brand, this.id, this.priceForDay, this.isAvailable);

  void displayInfo() {
    print(
        "Car's Brand:$brand, Model: $model, ID: $id, Price per Day: \$${priceForDay.toStringAsFixed(2)}, Available: $isAvailable");
  }
}